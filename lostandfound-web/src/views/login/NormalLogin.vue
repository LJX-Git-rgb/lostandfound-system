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
      <el-form-item label="账号" prop="userName">
        <el-input v-model="userName"  placeholder="请输入用户名 / 邮箱 / 账号" prefix-icon="el-icon-user"></el-input>
      </el-form-item>

      <el-form-item label="密码" prop="password">
        <el-input
            :type='pwdShow ? "password" : "text"'
            v-model="password"
            placeholder="请输入密码"
            prefix-icon="el-icon-lock"
        >
          <i id="showPwd" class="el-input__icon  el-icon-view" slot="suffix" @click="pwdShow = ! pwdShow" :style="{'color' : pwdShow ? '' : '#409eff'}"></i>
        </el-input>
        <a href="/forgetPwd" id="forgetpwd">忘记密码？点击找回</a>
      </el-form-item>
      <el-form-item id="loginButton">
        <el-button type="primary" id="loginButton" @click="loginForm">登录</el-button>
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
        <h2>新用户注册</h2>
      </template>
      <div id="reg-body" style="display:flex">
        <div id="left">
          <el-form :label-width="formLabelWidth" :ref="loginFormref" rules="loginFormRules">
            <el-form-item label="账号" prop="userName" >
              <el-input v-model="userName" placeholder="手机号\邮箱\用户名" ></el-input>
            </el-form-item>

            <el-form-item label="密码" prop="password" >
              <el-input v-model="password" type="password" placeholder="请输入密码" ></el-input>
            </el-form-item>

            <el-form-item label="确认密码" prop="checkPass" >
              <el-input v-model="checkPass" placeholder="请确认密码" type="password"  autocomplete="off"/>
            </el-form-item>

            <el-form-item label="验证码" >

            <div class="controls">
              <div class="input-icon left">
                <i class="icon-book"></i>
                <input style="width: 60%;float: left;height: 24px;" type="text" aria-placeholder="验证码" name="check" id="checkCode"/>
                <span style="cursor: pointer;float: right;height: 34px;width: 30%;">
                  <img src="../../assets/image/aaa.jpg" style="width: 100%;height: 90%;" alt="" @click="Reload">
                </span>
              </div>

            </div>
            </el-form-item>

          </el-form>

          <div class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button ref="loginFormref" type="info" @click="resetLoginForm">重 置</el-button>
            <el-button type="primary" @click="createUser">注 册</el-button>
          </div>
        </div>
        <div id="mid"></div>
        <div id="right">
          <center>
            <img src="../../assets/image/login_backImg.jpeg" alt="">
            <h4>微信扫码注册</h4>
          </center>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import VueGetCode from 'vue-get-code'
export default {

  components:{VueGetCode},

  data() {
    return {
      // captchaUrl: 'C:\\Users\\Jennifer\\Pictures\\suanfa\\aaa.jpg',
      userName: '',
      password: '',
      checkPass: '',
      // phone: '',//手机验证码
      //dialog form data
      dialogFormVisible: false,
      form: {},
      formLabelWidth: '80px',
      pwdShow: true,

      autoLogin: false,
      rememberPwd: false,
      checkCodeUrl:"",
    };
    // loginFormRules:{
    //   userName:[
    //     {required: true, message:'请输入用户名', trigger:'blur'},
    //     {min: 3,max: 10, message: '长度在3到10个字符',trigger: 'blur'}
    //   ];
    //   password:[
    //     {required: true, message:'请输入用户名', trigger:'blur'},
    //     {min: 3,max: 10, message: '长度在3到10个字符',trigger: 'blur'}
    //   ];
    //   checkPass:[
    //     {required: true, message:'请确认密码', trigger:'blur'},
    //     {}
    //   ]
    // }
  },
  mounted() {
      this.$axios({
        method: "post",
        url: "/user/check",
      }).then(res => {
        console.log("res",res)
        if(res.data.code == 200){

        }else{

        }
      }).catch(res => {
        this.$message.error("服务器错误，稍等会再登录")
        console.log(res);
      });
  },
  methods:{
    Reload() {
      this.$axios({
        method: "post",
        url: "/user/check",
      }).then(res => {
        console.log("res",res)
        if(res.data.code == 200){

        }else{

        }
      }).catch(res => {
        this.$message.error("服务器错误，稍等会再登录")
        console.log(res);
      });
    },
    resetLoginForm () {
      this.$nextTick(()=>{
           this.$refs.loginFormref.resetFields()
          }
      )
    },
    loginForm(){
      this.$axios({
        method: "post",
        url: "/user/login",
        data: {
          userName: this.userName,
          password: this.password
        }
      }).then(res => {
        console.log("res",res)
        if(res.data.code == 200){
          //放入localStorage
          /*localStorage适合浏览器历史记录和用过的用户名密码,而Cookie更适用于保持登录的状态,比如存储一个isLogin和登录用户的信息*/
          if(localStorage.getItem(this.userName) == null){
            localStorage.setItem(this.userName,this.password);
          }
          //更改vuex中的数据
          this.$store.dispatch('setUser',res.data.data)
          //这个是否登录可能需要存在cookie里
          this.$store.commit('setIsLogin',true);
          //路由转换
          this.$router.push({path:'/'})
        }else{
          this.$message.error(res.data.msg);
        }
      }).catch(res => {
        this.$message.error("服务器错误，稍等会再登录")
        console.log(res);
      });
    },
    // login(){
    //   console.log("haha")
    //   this.dialogFormVisible = false;
    //   this.login(this.form);//登录函数没了哈哈哈哈，你改没了吧，真离谱
    // },
    createUser(){
      this.dialogFormVisible = false;
      this.addUser(this.form);
    },

    addUser(user){
      this.$axios({
        method: "get",
        url: "/user/add",
        params: {
          userName: user.name,
          pwd: user.password,
        }
      }).then(res => {
        this.form = {}
        if(res.data.code == 200){
          this.$message({
            type: 'success',
            message: res.data.msg
          })
        }else{
          this.$message.error(res.data.msg);
        }
      }).catch(err => {
        this.$message.error("服务器错误，稍等会再注册")
        console.log(err);
      });
    },

    // 调用获取验证码的接口，此函数请返回 Promise 对象
    getCode() {
      if (this.phone.length < 7) {
        alert('请填写正确的手机号码')
        throw '请填写正确的手机号码' // 抛出错误，中断 Promise chain
      }

      let mockApi = 'https://cdn.jsdelivr.net/npm/vue@2/package.json'
      return fetch(mockApi)
    },
    log() {
      console.log(JSON.stringify(arguments))
    }
  }
}
</script>

<style lang="less" scoped>

//验证码组件
.vue-get-code {
  color: #1092ed;
  cursor: pointer;
  float: right;
}
.vue-get-code::after{
  clear: both;
}
.vue-get-code.enable-countdown {
  cursor: not-allowed;
}
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
  padding: 25px 50px 30px 10px;
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
  margin-left: 20%;
}
.dialog-footer{
  margin-right: -4%;
}
</style>