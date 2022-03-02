未完成
  1. 密码小眼睛查看
  2. 注册页面布局
  3. 页面一些内容不知道写什么
  4. 登录信息存入cookie和localStorage
<template>
  <div id="body">
    <div id="login-bac-img">
      <img src="../../public/image/login_backImg.jpeg" alt="">
    </div>
    <div id="login-logo">
      <!-- <img src="https://passport.baidu.com/static/passpc-account/img/baidu.png" alt=""> -->
    </div>
    <div id="login-text">
      <h3>用互联网</h3>
      <p>让您丢失的物品快速回到您身边</p>
    </div>
    <div id="login-content">
      <div id="login-guide-reg">
        <h3>欢迎登录失物招领网</h3>
        <p>
          没有账号？去<span id="register" @click="dialogFormVisible = true">注册</span>
        </p>
      </div>
      <el-form label-width="80px">
        <el-form-item label="账号">
          <el-input v-model="userName"  placeholder="请输入账号" prefix-icon="el-icon-user"></el-input>
        </el-form-item>
        
        <el-form-item label="密码">
          <el-input v-model="password"  placeholder="请输入密码" prefix-icon="el-icon-lock" suffix-icon="el-icon-view"></el-input>
        </el-form-item>
        
        <el-form-item>
          <el-button type="primary" id="loginButton" @click="login">登录</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div id="login-footer">
      <span id="login-help">
        <a id="login-help-text" href="">我需要帮助</a>
        <span id="login-help-line"></span>
        <!-- <a id="login-helper-service" href=""></a> -->
      </span>
    </div>

    <!-- reg message box -->
    <el-dialog title="我要注册哈哈哈" :visible.sync="dialogFormVisible">

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
export default {
  data() {
    return {
      userName: '',
      password: '',

      //dialog form data
      dialogFormVisible: false,
      form: {},
      formLabelWidth: '80px'
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
          this.$store.dispatch('setUser',res.data.data)
          //这个是否登录可能需要存在cookie里
          this.$store.commit('setIsLogin',true);
          //放入cookie和浏览器历史
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
  #login-bac-img{
    position: fixed;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    background: url(https://passport.baidu.com/static/passpc-account/img/reg_bg_min.jpg) no-repeat;
    background-size: cover;
  }
  #login-logo{
    position: fixed;
    left: 70px;
    top: 60px;
    width: 124.4px;
    height: 40px;

    border: 1px solid red;
  }
  #login-logo img{
    width: 100%;
    height: 100%;
  }
  #login-text{
    position: fixed;
    left: 195px;
    top: 314px;
    color: #fff;
  }
  #login-text h3{
    font-size: 40px;
    letter-spacing: 0;
    font-weight: 700;
  }
  #login-text p{
    font-size: 28px;
    letter-spacing: 3.81px;
    font-weight: 300;
  }
  #login-content{
    position: absolute;
    right: 139px;
    top: 50%;
    margin-top: -300px;
    width: 360px;
    height: 480px;
    background: rgba(255,255,255,.9);
    border-radius: 12px;
    border-radius: 12px;
    overflow: hidden;
  }
  #login-guide-reg{
    margin: 50px 0 22px 39px;
  }
  #login-content h3 {
    font-size: 30px;
    color: #000;
    padding-bottom: 4px;
  }
  #login-content p{
    font-size: 16px;
    color: #9B9B9B;
  }
  #register{
    color: #2e58ff;
    cursor: pointer;
  }
  #login-footer{
    position: fixed;
    left: 70px;
    bottom: 57px;
    font-size: 14px;
    color: #fff;

    border: 1px solid red;
  }
  #login-help a{
    text-decoration: none;
    color: #fff;
    cursor: pointer;
    opacity: 0.8;
  }
  #login-help-line{
    display: inline-block;
    width: 2px;
    height: 12px;
    filter: alpha(opacity=78);
    opacity: .78;
    margin: 0 12px 0 13px;
    background: #fff;
    position: relative;
    top: 1px;
  }

  /* 未完成，是错的 */
  #login-help-service{
    display: inline-block;
    width: 16px;
    height: 16px;
    background: url('https://ppui-static-pc.cdn.bcebos.com/static/passpc-account/img/reg/service-2x.png') no-repeat;
    background-size: 100%;
    position: relative;
    top: 3px;
  }
  /* element Ui */
  .el-form{
    margin-top: 70px;
    padding-right: 10%;
  }
  .el-form-item{
    margin-top: 40px;
  }

  /*  */
  #loginButton{
    width: 100%;
    border-radius: 18px;
    margin-top: 6%;
  }
 
</style>