<template>
    <div id="userInfo">
        <div id="userButton">
            <el-button @click="dialogFormVisible = true">新建</el-button>
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
            style="width: 100%">

            <el-table-column
            fixed
            prop="id"
            label="ID"
            width="150"
            sortable="">
            </el-table-column>
            <el-table-column
            prop="userName"
            label="姓名"
            width="120">
            </el-table-column>
            <el-table-column
            prop="age"
            label="年龄"
            width="120">
            </el-table-column>
            <el-table-column
            prop="sex"
            label="性别"
            width="120">
            </el-table-column>
            <el-table-column
            prop="address"
            label="地址"
            width="300">
            </el-table-column>
            <el-table-column
            prop="password"
            label="密码"
            width="120">
            </el-table-column>
            <el-table-column
            prop="tag"
            label="标签"
            width="100"
            :filters="[{ text: '家', value: '家' }, { text: '公司', value: '公司' }]"
            filter-placement="bottom-end">
            <template slot-scope="scope">
                <el-tag
                :type="scope.row.tag === '家' ? 'primary' : 'success'"
                disable-transitions>{{scope.row.tag}}</el-tag>
            </template>
            </el-table-column>
            <el-table-column
            fixed="right"
            label="操作"
            width="150">
            <template slot-scope="scope">
                <el-button @click="updateUser(scope.row)" type="text" size="small">编辑</el-button>
                <el-button
                    @click.native.prevent="deleteUser(scope.row)"
                    type="text"
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

        <el-dialog title="新建用户" :visible.sync="dialogFormVisible">
            <el-form :model="form">
                <el-form-item label="用户名" :label-width="formLabelWidth">
                    <el-input v-model="form.userName" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="用户密码" :label-width="formLabelWidth">
                    <el-input v-model="form.password" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="性别" :label-width="formLabelWidth">
                    <el-input v-model="form.sex" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="年龄" :label-width="formLabelWidth">
                    <el-input v-model="form.age" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="地址" :label-width="formLabelWidth">
                    <el-input v-model="form.address" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="标签" :label-width="formLabelWidth">
                    <el-select v-model="form.tag" placeholder="请选择活动区域">
                        <el-option label="家" value="home"></el-option>
                        <el-option label="公司" value="company"></el-option>
                    </el-select>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="createUser">确 定</el-button>
            </div>
        </el-dialog>
    </div>
  
</template>

<script>
import axios from 'axios'
  export default {
    data() {
      return {
        input: '',
        select: '',
        
        // table
        tableData:[],

        // page
        page: {
            total:0,
            currentPage: 0,
            pageSizes: [5, 10, 20, 50],
            pageSize: 5,
        },

        // dialog Form
        dialogFormVisible: false,
        form: {},
        formLabelWidth: '80px'
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
        resetDateFilter(){
            
        },
        clearFilter(){

        },
        downLoad(){

        },
        upLoad(){
            
        },

        createUser(){
            this.dialogFormVisible = false;
            this.addUser(this.form);
        },

        // axios function
        showUserInfo(){
            if(this.page.total == 0){
                this.countUserTotal();
            }
            axios({
                method: 'get',
                url: '/user/findAll',
                params:{
                    currentPage:this.page.currentPage,
                    pageSize:this.page.pageSize
                }
            }).then(res => {
                this.tableData = res.data;
            })
            .catch(function (error) {
                console.log(error);
            });
        },
        countUserTotal(){
            axios({
                method: 'get',
                url: '/user/countUser',
            }).then(res =>{
                this.page.total = res.data;
            })
        },
        addUser(user){
            axios({
                method: "post",
                url: "/user/add",
                data: user
            }).then(res => {
                this.showUserInfo();
                this.form = {}
            });
        },
        updateUser(row) {
            axios.get('/user/update',row)
            .then(res => {
                if(res.data.code == 200){
                    this.$message('编辑用户成功')
                }
                else{
                    this.$message.error(res.data.msg)
                }
            })
            .catch(function (error) {
                console.log(error);
            });
        },
        deleteUser(row) {
            axios({
                method:'get',
                url:'/user/delete',
                params:{
                    userId: row.id
                }
            })
            .then(res => {
                if(res.data.code == 200){
                    this.$message({
                        message: '删除用户成功',
                        type:'success'
                    })
                    this.showUserInfo();
                }
                else{
                    this.$message.error(res.data.msg)
                }
            })
            .catch(function (error) {
                console.log(error);
            });
        },
    },

    created(){
        this.showUserInfo();
    }
  }
</script>
<style scoped>
    #userInfo{
        margin: 10px;
    }
    #userButton{
        margin-bottom: 10px;
    }
    #select{
        width: 600px;
        margin-top: 15px;
    }

/* element-ui css */
    .el-select .el-input {
        width: 130px;
    }
    .input-with-select .el-input-group__prepend {
        background-color: #fff;
    }
</style>