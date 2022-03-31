登录页面已经基本完成，未完成
  0. logo
  2. 登录信息存入cookie和localStorage（简单）
  3. 自动登录和记住密码（不难）
  4. 注册需要的验证码（网上搜搜应该有组件）
  5. 忘记/找回密码（仿照注册写就可以，关键点在于完整的逻辑，需要发邮件的工具类）
  6. 两种登录方式的切换效果，主要是样式（很简单）

  7. 修改成响应式布局 （尽量）
  
  大问题
    1. 微信登录注册（以后做）
<template>
  <div id="body">
    <div id="login-bac-img">
      <img src="../../assets/image/login_backImg.jpeg" alt="">
    </div>
    <div id="login-logo">
       <img src="../../assets/image/logo.png" alt="">
    </div>
    <div id="login-text">
      <h3>用互联网</h3>
      <p>让您丢失的物品快速回到您身边</p>
    </div>
    <div id="login-content" class="tab">
      <div id="loginMethod" class="tab_list">
        <div  id="normalLogin" :class="normalCurrent" @click="showNormalLogin">
            <span>账号密码登录</span>
        </div>
        <div id="wechatLogin" :class="wechatCurrent" @click="showWechatLogin">
            <span >微信扫码登录</span>
        </div>
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
      normalCurrent:"current",
      wechatCurrent:"",
    };
  },
  methods:{
    showNormalLogin(){
      this.$router.push({path:'/login'})
      this.normalCurrent = "current"
      this.wechatCurrent = ""
    },
    showWechatLogin(){
      this.$router.push({path:'/login/wechat'})
      this.normalCurrent = ""
      this.wechatCurrent = "current"
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
    left: 100px;
    top: 40px;
  }
  #login-logo img{
    width: 100%;
    height: 100%;
    filter: invert(100%);
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
  /*点击改变背景颜色*/
#login-content .tab_list .current{
    background-color: #ffffff !important;
    color: #000000 !important;
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
  #login-content #loginMethod #normalLogin:hover,
  #login-content #loginMethod #wechatLogin:hover{
    opacity: 1;
  }
  #login-content #loginMethod #wechatLogin{
    flex: 1;
  }
  #login-content #loginMethod div {
    background-color: #cccccc;
    opacity: 0.7;
    color: #ffffff;
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