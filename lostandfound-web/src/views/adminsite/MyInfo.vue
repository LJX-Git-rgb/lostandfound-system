<!--后台我的信息页面-->

<template>
    <div id="adminInfo">
        <div id="adminButton">
            <el-button @click="upLoad">导入</el-button>
            <el-button @click="downLoad">导出</el-button>
        </div>

        <el-table
            :data="tableData"
            border
            :highlight-current-row="true"
            style="width: 100%"
            ref="multipleTable"
            tooltip-effect="dark"
            @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="id" label="ID" width="150" sortable=""></el-table-column>
            <el-table-column prop="name" label="管理员名" width="120"></el-table-column>
            <el-table-column prop="pwd" label="密码" width="150"></el-table-column>
            <el-table-column prop="phone" label="电话" width="300"></el-table-column>

            <!-- <el-table-column prop="createtime" label="标签" width="100"
                :filters="[{ text: '家', value: '家' }, { text: '公司', value: '公司' }]"
                filter-placement="bottom-end">
                <template slot-scope="scope">
                    <el-tag
                    :type="scope.row.tag === '家' ? 'primary' : 'success'"
                    disable-transitions>{{scope.row.tag}}</el-tag>
                </template>
            </el-table-column> -->
            <el-table-column fixed="right" label="操作" width="150">
                <template slot-scope="scope">
                    <el-button @click="updateUser(scope.row)" type="primary" size="small">编辑</el-button>
                    <el-button
                        @click.native.prevent="deleteUser(scope.row)"
                        type="danger"
                        size="small">
                        移除
                    </el-button>
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
                url: '/api/account/findAll',
                params: {
                    currentPage: this.page.currentPage,
                    pageSize: this.page.pageSize
                }
            }).then(res => {
                this.tableData = res.data;
            })
                .catch(function (error) {
                    console.log(error);
                });
        },
        countUserTotal() {
            this.$axios({
                method: 'get',
                url: '/api/account/countUser',
            }).then(res => {
                this.page.total = res.data;
            })
        },
    },

    created() {
        this.showUserInfo();
    }
}
</script>

<style lang="less" scoped>
#userInfo {
    margin: 10px;

    #userButton {
        margin-bottom: 10px;
    }
}

//#select{
//    width: 600px;
//    margin-top: 15px;
//}
</style>