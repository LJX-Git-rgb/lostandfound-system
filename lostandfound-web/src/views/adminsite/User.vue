<!--后台用户信息管理-->

<template>
    <div id="userInfo">
        <div id="userButton">
            <div id="select">
                <el-input placeholder="请输入用户ID" v-model="searchInput" class="input-with-select">
                    <el-select v-model="select" slot="prepend" placeholder="请选择" style="width:100px">
                      <el-option label="ID" value="1"></el-option>
                      <el-option label="姓名" value="2"></el-option>
                      <el-option label="邮箱" value="3"></el-option>
                    </el-select>
                    <el-button slot="append" icon="el-icon-search" @click="adminSearchUserByInfo"></el-button>
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
            <el-table-column prop="nickName" label="姓名" width="80"></el-table-column>
            <el-table-column prop="gender" label="性别" width="50"></el-table-column>
            <el-table-column prop='userRole' label="身份" width="100">
                <template #default="scope">
                    <el-tag size="small" id="tag">{{ scope.row.userRole == 1 ? '正常用户' :'认证用户'}}</el-tag>
                </template>
            </el-table-column>
            <el-table-column prop="email" label="注册邮箱" width="180"></el-table-column>
            <el-table-column prop="createTime" label="创建时间" width="180"></el-table-column>
            <el-table-column prop="updateTime" label="最后更新时间"width="180"></el-table-column>

            <el-table-column fixed="right" label="操作">
                <template slot-scope="scope">
                    <div style="display: flex">
                      <el-button @click.native.prevent="violate(scope.row)" type="warning" size="small">禁言</el-button>
                      <el-button @click.native.prevent="relieve(scope.row)" type="success" size="small">解除</el-button>
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
            searchInput: '',
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

      //禁言
      violate:function (){

        },

      //解除
      relieve:function(){

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
            }).catch(err => {
                console.log(err);
                this.$message.error("服务器错误")
            })
        },
        countUserTotal() {
            this.$axios({
                method: 'get',
                url: '/api/account/countUser',
            }).then(res => {
                this.page.total = res.data;
            })
        },

        adminSearchUserByInfo(){
                this.$axios({
                    url:'/api/user/searchUserContact',
                    method:'get',
                    params:{
                        flag: this.select,
                        input: this.searchInput,
                    }
                }).then(res=>{
                    console.log(res);
                    this.tableData = res.data;
                })
        }
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