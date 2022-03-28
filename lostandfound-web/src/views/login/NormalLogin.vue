<template>
    <div>
        <div id="login-guide-reg">
            <h3>欢迎登录失物招领网</h3>
            <p>
                没有账号？去<span id="register" @click="regist">注册</span>
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

						<el-form-item label="密码">
							<el-input v-model="form.password" placeholder="设置您的密码"></el-input>
						</el-form-item>

						<el-form-item label="验证码" id="identifyCode">
<!--							<el-input placeholder="请输入电话号码" v-model="phone"/>-->
<!--							验证码：未完善-->
<!--							<vue-get-code-->
<!--								:getCode="getCode"-->
<!--								:interval="30"-->
<!--								:disable="!phone"-->
<!--								>-->
<!--								-->
<!--								<template v-slot:default="child">{{child.count<=0 ? "haha" : "嘿嘿"}}"+"{{child}}</template>-->
<!--								<template v-slot:countdown="child">请等待{{ child.data.interval - child.data.seconds }}秒</template>-->
<!--							</vue-get-code>-->
                            <el-input v-model="checkCode" placeholder="请输入验证码"></el-input>
                            <div id="get-code" @click="refreshCode">
                                <SIdentify :identifyCode="identifyCode"></SIdentify>
                            </div>
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
import VueGetCode from 'vue-get-code'
import SIdentify from "@/components/utils/SIdentify";
export default {
	components:{SIdentify, VueGetCode},
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
			rememberPwd:false,

			//验证码
			checkCode:'',
            identifyCode: "",
            identifyCodes: "0123456789abcdwerwshdjeJKDHRJHKOOPLMKQ",//绘制的随机数
		};
	},
	methods:{
        randomNum (min, max) {
            max = max + 1
            return Math.floor(Math.random() * (max - min) + min)
        },
        // 随机生成验证码字符串
        makeCode (data, len) {
            for (let i = 0; i < len; i++) {
                this.identifyCode += data[this.randomNum(0, data.length - 1)]
            }
        },
        refreshCode() {
            this.identifyCode = "";
            this.makeCode(this.identifyCodes,4);
        },
        regist(){
            this.dialogFormVisible = true;
            this.refreshCode()
        },

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

		createUser(){
			this.dialogFormVisible = false;
			this.addUser(this.form);
		},

		addUser(user){
			this.$axios({
				method: "get",
				url: "/user/add",
				params: {
					userName: this.form.name,
					pwd: this.form.password,
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
				console.log(res);
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
  /deep/ #identifyCode .el-form-item__content{
      display: flex;
      #get-code{
      }
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