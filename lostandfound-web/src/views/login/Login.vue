登录页面已经基本完成，未完成的几个需要联合后台完成
  0. logo
  2. 登录信息存入cookie和localStorage
  3. 自动登录和记住密码
  4. 注册需要的验证码
  最小分辨率为1157 * 613左右
<template>
  <div id="body">
    <div id="login-bac-img">
      <img src="../../assets/image/login_backImg.jpeg" alt="">
    </div>
    <div id="login-logo">
      <!-- <img src="https://passport.baidu.com/static/passpc-account/img/baidu.png" alt=""> -->
    </div>
    <div id="login-text">
      <h3>用互联网</h3>
      <p>让您丢失的物品快速回到您身边</p>
    </div>
    <div id="login-content">
      <div id="loginMethod">
        <div id="normalLogin" @click="showNormalLogin"><span>账号密码登录</span></div>
        <div id="wechatLogin"  @click="showWechatLogin"><span>微信登录</span></div>
      </div>
      <router-view></router-view>
    </div>
    <div id="login-footer">
      <span id="login-help">
        <a id="login-help-text" href="">我需要帮助</a>
        <span id="login-help-line"></span>
        <a id="login-helper-service" href="" class="el-icon-headset"></a>
      </span>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {},
    };
  },
  methods:{
    showNormalLogin(){
      this.$router.push({path:'/login'})
    },
    showWechatLogin(){
      this.$router.push({path:'/login/wechat'})
    }
  }
}
</script>

<style scoped>
/* back image */
  #login-bac-img{
    position: fixed;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    background: url(../../assets/image/login_backImg.jpeg) no-repeat;
    background-size: cover;
  }

/* logo */
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

/* text */
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

  /* content */
  #login-content{
    position: absolute;
    right: 139px;
    top: 50%;
    margin-top: -300px;
    width: 420px;
    height: 520px;
    background: rgba(255,255,255,.9);
    border-radius: 12px;
    overflow: hidden;
  }
  #login-content #loginMethod{
    display: flex;
    height: 40px;
    line-height: 50px;
    border-bottom: 2px solid rgba(200,200,200,0.75);
    cursor: pointer;
  }
  #login-content #loginMethod #normalLogin{
    flex: 1;
    border-right: 2px solid rgb(200,200,200);
  }
  #login-content #loginMethod #normalLogin:hover{
    background-color: aqua;
  }
  #login-content #loginMethod #wechatLogin{
    flex: 1;
  }
  #login-content #loginMethod #wechatLogin:hover{
    background-color: aqua;
  }
  #login-content #loginMethod span{
    width: 100%;
    font-size: 20px;
    margin-left: 27%;

  }

  /* footer&helper */
  #login-footer{
    position: fixed;
    left: 70px;
    bottom: 57px;
    font-size: 14px;
  }
  #login-help a{
    text-decoration: none;
    color: #fff;
    cursor: pointer;
    opacity: 0.8;
    font-weight: 500;
  }
  #login-help-line{
    display: inline-block;
    width: 2px;
    height: 12px;
    opacity: .78;
    margin: 0 12px;
    background: #fff;
    position: relative;
    top: 1px;
  }
</style>