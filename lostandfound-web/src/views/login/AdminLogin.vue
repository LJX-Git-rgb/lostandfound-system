<template>
    <div id="adminLogin">
        <el-form :model="form">
            <el-form-item label-width="70px">
                <h1>管理员登录</h1>
            </el-form-item>
            <el-form-item label="用户名" :label-width="formLabelWidth">
                <el-input v-model="name" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="密码" :label-width="formLabelWidth">
                <el-input v-model="pwd" autocomplete="off" type="password"></el-input>
            </el-form-item>
            <el-form-item :label-width="formLabelWidth">
                <el-button type="primary" @click="adminLogin">登录</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
export default {
    data() {
        return {
            name: '',
            pwd: '',
            form: {},
            formLabelWidth: '120px'
        }
    },
    methods: {
        adminLogin() {
            this.$axios({
                method: "post",
                url:"/api/adminUser/login",
                data: {
                    name: this.name,
                    pwd: this.pwd
                }
            }).then(res => {
                if (res.data.code == 200) {
                    console.log(res.data)
                    this.$store.dispatch('setAdmin', res.data.data[0])
                    //这个是否登录可能需要存在cookie里
                    //路由转换
                    this.$router.push({
                        path: "user"
                    })
                } else {
                    this.$message.error(res.data.msg);
                }
            }).catch(res => {
                this.$message.error("服务器错误，稍等会再登录")
                console.log(res);
            });
        }
    },
}
</script>

<style lang="less" scoped>
#adminLogin {
    width: 100%;
    background-color: #bfc7d7;

    h1 {
        text-align: center;
        margin-bottom: 0px;
    }

    form {
        margin: auto;
        position: relative;
        top: 10%;
        width: 560px;
        height: 350px;

        button {
            width: 100%;
        }

        .el-form-item {
            margin-top: 30px;
        }
    }
}
</style>