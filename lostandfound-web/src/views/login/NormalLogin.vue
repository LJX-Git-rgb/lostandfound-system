<template>
    <div>
        <div id="login-guide-reg">
            <h3>欢迎登录失物招领网</h3>
            <p>
                没有账号？去<span id="register" @click="dialogFormVisible = true">注册</span>
            </p>
        </div>
        <!-- login form -->
        <el-form :label-width="formLabelWidth" class="login-form">
            <el-form-item label="账号">
                <el-input v-model="userName"  placeholder="请输入用户名 / 邮箱 / 账号" prefix-icon="el-icon-user"></el-input>
            </el-form-item>

            <el-form-item label="密码">
                <el-input 
                :type='pwdShow ? "password" : "text"' 
                v-model="password"  
                placeholder="请输入密码" 
                prefix-icon="el-icon-lock"
                >
                <i id="showPwd" class="el-input__icon  el-icon-view" slot="suffix" @click="pwdShow = !pwdShow" :style="{'color' : pwdShow ? '' : '#409eff'}"></i>
                </el-input>
                <a href="/forgetPwd" id="forgetpwd">忘记密码？点击找回</a>
            </el-form-item>
            <el-form-item id="loginbutton">
                <el-button type="primary" id="loginButton" @click="login">登录</el-button>
                <div style="display:flex">
                <el-checkbox v-model="rememberPwd" style="flex:1">记住密码</el-checkbox>
                <el-checkbox v-model="autoLogin" style="flex:1">自动登录</el-checkbox>
                </div>
            </el-form-item>
        </el-form>

    <!-- reg message box -->
        <el-dialog
        :visible.sync="dialogFormVisible"
        center
        width="60%"
        top="19vh"
        >
            <template slot="title">
                <h2>我要注册</h2>
            </template>
            <div id="reg-body" style="display:flex">
                <div id="left">
                <el-form ref="form" :model="form" :label-width="formLabelWidth">
                    <el-form-item label="昵称">
                    <el-input v-model="form.name" placeholder="起个昵称吧"></el-input>
                    </el-form-item>

                    <!-- <el-form-item label="学号">
                    <el-input v-model="form.userName"  placeholder="我们需要您的学号">
                        <el-tooltip effect="dark" content="请认真填写，我们会核实您的学号" slot="suffix" placement="bottom">
                        <a class="el-input__icon  el-icon-warning-outline" ></a>
                        </el-tooltip>
                    </el-input>
                    </el-form-item> -->

                    <el-form-item label="密码">
                    <el-input v-model="form.password" placeholder="设置您的密码"></el-input>
                    </el-form-item>

                    <el-form-item label="性别">
                    <el-radio-group v-model="form.resource">
                        <el-radio label="男"></el-radio>
                        <el-radio label="女"></el-radio>
                        <el-radio label="未知"></el-radio>
                    </el-radio-group>
                    </el-form-item>
                </el-form>

                <div class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="createUser">确 定</el-button>
                </div>
                </div>
                <div id="mid"></div>
                <div id="right">
                <center>
                    <img src="../../assets/image/login_backImg.jpeg" alt="">
                    <h4>微信扫二维码直接登录</h4>
                </center>
                </div>
            </div>
        </el-dialog>
    </div>
</template>

<script>
export default {
  data() {
    return {
      userName: '',
      password: '',

      //dialog form data
      dialogFormVisible: false,
      form: {},
      formLabelWidth: '80px',

      pwdShow: true,

      autoLogin:false,
      rememberPwd:false
    };
  },
  methods:{
    login(){
      this.$axios({
        method: "post",
        url: "/user/login",
        data: {
          userName: this.userName,
          password: this.password
        }
      }).then(res => {
        if(res.data.code == 200){
          //放入localStorage
          /*localStorage适合浏览器历史记录和用过的用户名密码,而Cookie更适用于保持登录的状态,比如存储一个isLogin和登录用户的信息*/
          if(localStorage.getItem(this.userName) == null){
            localStorage.setItem(this.userName,this.password);
          }
          this.$store.dispatch('setUser',res.data.data)
          //这个是否登录可能需要存在cookie里
          this.$store.commit('setIsLogin',true);
          //路由转换
          this.$router.push({path:'/allUser'})
        }
        else{
          this.$message.error(res.data.msg);
        }
      }).catch(res => {
        this.$message.error("服务器错误，稍等会再登录")
        console.log(res);
      });
    },

    createUser(){
      this.dialogFormVisible = false;
      this.addUser(this.form);
    },

    addUser(user){
      axios({
          method: "post",
          url: "/user/add",
          data: user
      }).then(res => {
          this.form = {}
      });
    },
    }
}
</script>

<style scoped>
/* text */
  #login-guide-reg{
    margin: 35px 0 22px 39px;
  }
  #login-guide-reg h3 {
      font-size: 28px;
      color: #000;
      padding-bottom: 4px;
  }
  #login-guide-reg p{
    font-size: 16px;
    color: #9B9B9B;
  }
  #login-guide-reg p #register{
    color: #2e58ff;
    cursor: pointer;
  }
  
/* form */
  .login-form{
    margin-top: 45px;
    padding-right: 10%;
  }
  .login-form .el-form-item{
      margin-top: 30px;
  }
  .login-form #loginButton{
    margin-top: 0px;
    width: 100%;
    border-radius: 18px;
  }
  #showPwd{
      cursor: pointer;
  }
  #showPwd:hover{
      color: #409eff;
  }
  #forgetpwd{
    margin-left: 60%;
    font-size: 12px;
    color: #2e58ff;
  }

/* dialog */
  /deep/ .el-dialog{
    border-radius: 12px;
  }
  /deep/ .el-dialog--center .el-dialog__body{
    padding: 25px 30px 20px 0px;
  }

  /* dialog body */
  #reg-body #left{
    flex: 1;
  }
  #reg-body #mid{
    background: grey;
    opacity: 0.5;
    flex: 0.005;
    margin: 0 6%;
  }
  #reg-body #right{
    flex: 1;
  }
  #reg-body #right img{
    width: 300px;
    height: 250px;
  }
  
  /* dialog footer */
  .dialog-footer{
    display: flex;
    margin-left: 37%;
  }
  .dialog-footer{
    margin-right: -4%;
  }
</style>