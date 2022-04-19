<!--后台失物招领管理页面-->

<template>
    <div id="userInfo">
        <div id="userButton">
          <el-button @click="resetDateFilter">清除日期过滤器</el-button>
          <el-button @click="clearFilter">清除所有过滤器</el-button>
            <el-button @click="upLoad">导入</el-button>
            <el-button @click="downLoad">导出</el-button>
            <div id="select">
                <el-input placeholder="请输入内容" v-model="input" class="input-with-select">
                    <el-select v-model="select" slot="prepend" placeholder="请选择">
                        <el-option label="人名" value="1"></el-option>
                    </el-select>
                    <el-button slot="append" icon="el-icon-search"></el-button>
                </el-input>
            </div>
        </div>

        <el-table
            :data="tableData"
            border
            :fit="true"
            :highlight-current-row="true"
            style="width: 100%"
            ref="multipleTable"
            tooltip-effect="dark"
            @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="id" label="ID" width="90" sortable=""></el-table-column>
            <el-table-column prop="image" label="图片" width="80"></el-table-column>
            <el-table-column prop="title" label="失物招领标题" width="120"></el-table-column>
            <el-table-column prop="description" label="详情描述" width="80"></el-table-column>
            <el-table-column prop='state' label="认领状态" width="100"></el-table-column>
            <el-table-column prop="create_time" label="发布日期" width="180"></el-table-column>
            <el-table-column prop="found_area" label="找到区域" width="180"></el-table-column>
            <el-table-column prop="found_time" label="找到日期"width="180"></el-table-column>
            <el-table-column fixed="right" label="操作">
                <template slot-scope="scope">
                    <div style="display: flex">
                        <el-button @click="updateUser(scope.row)" type="primary" size="small">编辑</el-button>
                        <el-button @click="updateUser(scope.row)" type="danger" size="small">移除</el-button>
                    </div>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="page.currentPage"
            :page-sizes="page.pageSizes"
            :page-size="page.pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="page.total">
        </el-pagination>
    </div>
</template>

<script>
export default {
    data() {
        return {
            input: '',
            select: '',

            // table
            tableData: [],

            // page
            page: {
                total: 0,
                currentPage: 0,
                pageSizes: [5, 10, 20, 50],
                pageSize: 5,
            },
        }
    },
    methods: {
        handleSizeChange(val) {
            console.log(`每页 ${val} 条`);
            this.page.pageSize = val
            this.showUserInfo()
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
            this.page.currentPage = val;
            this.showUserInfo()
        },
        downLoad() {

        },
        upLoad() {

        },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },

        // axios function
        showUserInfo() {
            if (this.page.total == 0) {
                this.countUserTotal();
            }
            this.$axios({
                method: 'get',
                url: '/account/findAll',
                params: {
                    currentPage: this.page.currentPage,
                    pageSize: this.page.pageSize
                }
            }).then(res => {
                this.tableData = res.data;
            }).catch(err => {
                console.log(err);
                this.$message.error("服务器错误")
            })
        },
        countUserTotal() {
            this.$axios({
                method: 'get',
                url: '/account/countUser',
            }).then(res => {
                this.page.total = res.data;
            })
        },
    },
    mounted() {
        this.showUserInfo();
    }
}
</script>

<style lang="less" scoped>
#userInfo {
    margin: 10px;
    flex: 1;
    #userButton {
        margin-bottom: 10px;
        #select{
            margin-top: 10px;
            width: 600px;
        }
    }
}
</style>