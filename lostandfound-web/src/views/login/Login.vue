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
        <div id="login-content">
            <div id="loginMethod">
                <div id="normalLogin" :class="normalCurrent" @click="showNormalLogin">
                    <span>账号密码登录</span>
                </div>
                <div id="wechatLogin" :class="wechatCurrent" @click="showWechatLogin">
                    <span>微信扫码登录</span>
                </div>
            </div>
            <router-view></router-view>
        </div>
        <div id="login-footer">
      <span id="login-help">
        <a id="login-help-text" href="" @click="$router.push({path:'/help'})">我需要帮助</a>
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
            normalCurrent: "current",
            wechatCurrent: "",
        };
    },
    methods: {
        showNormalLogin() {
            this.$router.push({path: '/login'})
            this.normalCurrent = "current"
            this.wechatCurrent = ""
        },
        showWechatLogin() {
            this.$router.push({path: '/login/wechat'})
            this.normalCurrent = ""
            this.wechatCurrent = "current"
        }
    }
}
</script>

<style lang="less" scoped>
#body {
    /* back image */

    #login-bac-img {
        position: fixed;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        background: url(../../assets/image/login_backImg.jpeg) no-repeat;
        background-size: cover;
    }

    #login-logo {
        position: fixed;
        left: 3%;
        top: 1%;

        img {
            width: 50%;
            height: 50%;
            filter: invert(100%);
        }
    }

    #login-text {
        position: fixed;
        left: 150px;
        top: 214px;
        color: #fff;

        h3 {
            font-size: 40px;
            letter-spacing: 0;
            font-weight: 700;
        }

        p {
            font-size: 28px;
            letter-spacing: 3.81px;
            font-weight: 300;
        }
    }

    #login-content {
        position: absolute;
        right: 130px;
        top: 45%;
        margin-top: -190px;
        width: 380px;
        height: 480px;
        background: rgba(255, 255, 255, .9);
        border-radius: 12px;
        overflow: hidden;

        #loginMethod {
            display: flex;
            height: 40px;
            line-height: 50px;
            cursor: pointer;

            .current {
                background-color: #ffffff !important;
                color: #000000 !important;
            }

            #normalLogin {
                flex: 1;
                border-right: 2px solid rgb(200, 200, 200);
            }

            #normalLogin:hover,
            #wechatLogin:hover {
                opacity: 1;
            }

            #wechatLogin {
                flex: 1;
            }

            div {
                background-color: #cccccc;
                opacity: 0.7;
                color: #ffffff;
            }

            span {
                width: 100%;
                font-size: 19px;
                margin-left: 20%;
            }
        }
    }

    #login-footer {
        position: fixed;
        left: 70px;
        bottom: 57px;
        font-size: 14px;

        #login-help {
            a {
                text-decoration: none;
                color: #fff;
                cursor: pointer;
                opacity: 0.8;
                font-weight: 500;
            }

            #login-help-line {
                display: inline-block;
                width: 2px;
                height: 12px;
                opacity: .78;
                margin: 0 12px;
                background: #fff;
                position: relative;
                top: 1px;
            }
        }
    }
}
</style>