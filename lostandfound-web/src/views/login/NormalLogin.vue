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
                <el-input v-model="loginForm.account" placeholder="请输入邮箱" prefix-icon="el-icon-user"></el-input>
            </el-form-item>

            <el-form-item label="密码">
                <el-input
                    :type='pwdShow ? "password" : "text"'
                    v-model="loginForm.password"
                    placeholder="请输入密码"
                    prefix-icon="el-icon-lock"
                >
                    <i id="showPwd" class="el-input__icon  el-icon-view" slot="suffix" @click="pwdShow = !pwdShow"
                       :style="{'color' : pwdShow ? '' : '#409eff'}"></i>
                </el-input>
                <span id="forgetpwd" @click="foundPwdDialogFormVisible = true;">忘记密码?点击找回</span>
            </el-form-item>

            <el-form-item id="loginbutton">
                <el-button type="primary" id="loginButton" @click="login">登录</el-button>
                <div style="display:flex">
                    <el-checkbox v-model="rememberPwd" style="flex:1">记住密码</el-checkbox>
                    <el-checkbox v-model="autoLogin" style="flex:1">自动登录</el-checkbox>
                </div>
            </el-form-item>
        </el-form>

        <!--find pssword-->
        <el-dialog
            :visible.sync="foundPwdDialogFormVisible"
            center
            width="35%"
            top="30vh">

            <template slot="title"><h2>找回密码</h2></template>
            <el-form ref="form" :label-width="formLabelWidth">
                <el-form-item label="邮箱：">
                    <el-input v-model="forgetPwdEmail" placeholder="请输入邮箱"></el-input>
                </el-form-item>
                <el-form-item label="验证码：" id="identifyCode">
                    <el-input placeholder="请输入验证码" v-model="inputCheckCode" id="inputCheckCode"/>
                    <vue-get-code
                        :getCode="getCode"
                        :interval="60">
                        <template v-slot:default>获取验证码</template>
                        <template v-slot:countdown="child">
                            请等待{{ child.data.interval - child.data.seconds }}秒
                        </template>
                    </vue-get-code>
                </el-form-item>
            </el-form>
            <div class="reg-dialog-footer">
                <el-button type="primary" @click="foundPwd">确 定</el-button>
            </div>
        </el-dialog>
        <!--change password-->
        <el-dialog
            :visible.sync="changePwdDialogFormVisible"
            center
            width="35%"
            top="30vh">

            <template slot="title"><h2>找回密码</h2></template>
            <el-form :model="regForm" :rules="rules" label-width="100px">
                <el-form-item label="新密码：" prop="password">
                    <el-input v-model="regForm.password" placeholder="请输入新密码"></el-input>
                </el-form-item>
                <el-form-item label="确认新密码：" prop="checkPwd">
                    <el-input v-model="regForm.checkPwd" placeholder="请确认新密码"></el-input>
                </el-form-item>
            </el-form>
            <div class="reg-dialog-footer">
                <el-button type="primary" @click="updatePwd">更新我的密码</el-button>
            </div>
        </el-dialog>
        <!-- reg message box -->
        <el-dialog
            :visible.sync="regDialogFormVisible"
            center
            width="60%"
            top="19vh"
        >
            <template slot="title">
                <h2>我要注册</h2>
            </template>

            <div id="reg-body" style="display:flex">
                <div id="left">
                    <el-form :model="regForm" :rules="rules" :label-width="formLabelWidth">
                        <el-form-item label="邮箱" prop="email" >
                            <el-input v-model="regForm.email" placeholder="输入注册用邮箱"></el-input>
                        </el-form-item>
                        <el-form-item label="密码" prop="password">
                            <el-input v-model="regForm.password" type="password" placeholder="设置您的密码"></el-input>
                        </el-form-item>
                        <el-form-item label="确认密码" prop="checkPwd">
                            <el-input v-model="regForm.checkPwd" type="password" placeholder="确认您的密码"></el-input>
                        </el-form-item>
                        <el-form-item label="验证码" prop="identifyCode" id="identifyCode">
                            <el-input v-model="regForm.identifyCode" placeholder="请输入验证码"></el-input>
                            <div id="get-code" @click="refreshCode">
                                <SIdentify :identifyCode="createdIdentifyCode"></SIdentify>
                            </div>
                        </el-form-item>
                    </el-form>

                    <div class="dialog-footer">
                        <el-button @click="regDialogFormVisible = false">取 消</el-button>
                        <el-button type="primary" @click="createUser">确 定</el-button>
                    </div>
                </div>

                <div id="mid"></div>

                <div id="right">
                        <img src="../../assets/image/login_backImg.jpeg" alt="">
                        <h4>微信扫二维码直接登录</h4>
                </div>
            </div>

        </el-dialog>
    </div>
</template>

<script>
import VueGetCode from 'vue-get-code'
import SIdentify from "@/components/utils/SIdentify";

export default {
    components: {SIdentify, VueGetCode},
    data() {
        // 注册密码和验证码的校验
        var validatePass = (rule, value, callback) => {
            if (this.regForm.password === '') {
                callback(new Error('请输入密码'));
            }
        };
        var validatePass2 = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请再次输入密码'));
            } else if (value !== this.regForm.password) {
                callback(new Error('两次输入密码不一致!'));
            } else {
                callback();
            }
        };
        var validateIdentifyCode = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入验证码'));
            } else if (value.toUpperCase() !== this.createdIdentifyCode.toUpperCase()) {
                callback(new Error('验证码与图片不符!'));
            } else {
                callback();
            }
        };
        return {
            // login data
            loginForm:{
                account: '', // 能是用户名/邮箱
                password: '',
            },

            //IdentifyCode
            createdIdentifyCode: "",
            identifyCodes: "0123456789abcdwerwshdjeJKDHRJHKOOPLMKQ",//绘制的随机数

            //dialog setting
            formLabelWidth: '80px',

            //reg dialog data
            regDialogFormVisible: false,
            regForm: {
                email:"",
                password:"",
                checkPwd:"",
                identifyCode:"",
            },

            //findPwd data,找回密码和确认密码使用regForm内的变量
            foundPwdDialogFormVisible: false,
            changePwdDialogFormVisible: false,
            inputCheckCode:'',
            forgetPwdEmail: '',

            //form rules
            rules:{
                email: [
                    { required: true, message: '请输入邮箱地址', trigger: 'blur' },
                    { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
                ],
                account: [
                    { required: true, message: '请输入账号', trigger: 'blur' },
                ],
                password: [
                    { validator: validatePass, trigger: 'blur' }
                ],
                checkPwd: [
                    { validator: validatePass2, trigger: 'blur' }
                ],
                identifyCode:[
                    {validator: validateIdentifyCode, trigger: 'blur' },
                ],
            },

            //show pwd & autoLogin rememberPwd flag
            pwdShow: true,
            autoLogin: false,
            rememberPwd: false,

        };
    },
    methods: {
        //create reg checkCode
        randomNum(min, max) {
            max = max + 1
            return Math.floor(Math.random() * (max - min) + min)
        },
        makeCode(data, len) {
            for (let i = 0; i < len; i++) {
                this.createdIdentifyCode += data[this.randomNum(0, data.length - 1)]
            }
        },
        refreshCode() {
            this.createdIdentifyCode = "";
            this.makeCode(this.identifyCodes, 4);
        },

        //found pwd checkCode & foundPwd methods
        getCode() {
            this.sendEmail();
        },
        sendEmail() {
            this.$axios({
                method: "post",
                url: "/user/retrive",
                data: {
                    email: this.forgetPwdEmail,
                    identifyCode: this.createdIdentifyCode
                }
            }).then(res => {
                if (res.data.code == 200) {
                    this.$message({
                        type: 'success',
                        message: res.data.msg
                    })
                } else {
                    this.$message.error(res.data.msg);
                }
                console.log(res)
            }).catch(err => {
                this.$message.error("服务器错误，稍等会再找回密码")
                console.log(res);
            });
        },
        foundPwd() {
            if (this.createdIdentifyCode.toLowerCase() == this.inputCheckCode.toLowerCase()) {
                //    tiao zhuan到更改密码的弹窗
                this.foundPwdDialogFormVisible = false;
                setTimeout(() => {}, 3000)
                this.changePwdDialogFormVisible = true;
            } else {
                this.$message.error("验证码错误");
            }
        },
        updatePwd(){
            this.$axios({
                method: "post",
                url: "/user/changepwd",
                data:{
                    email:this.forgetPwdEmail,
                    newPwd: this.regForm.password,
                }
            }).then(res => {
                if(res.data.code ==200){
                    this.$message({
                        type:'success',
                        message:"密码更新成功"
                    })
                    this.changePwdDialogFormVisible = false;
                }else{
                    this.$message.error(res.data.msg);
                }
            })
        },

        //reg methods
        regist() {
            this.regDialogFormVisible = true;
        },
        createUser() {
            if (this.regForm.identifyCode.toLowerCase() != this.createdIdentifyCode.toLowerCase()){
                this.$message.error("验证码不匹配");
            }else {
                this.regDialogFormVisible = false;
                this.addUser();
            }
        },
        addUser() {
            this.$axios({
                method: "post",
                url: "/user/add",
                data: {
                    email : this.regForm.email,
                    password : this.regForm.password
                }
            }).then(res => {
                this.form = {}
                if (res.data.code == 200) {
                    this.$message({
                        type: 'success',
                        message: res.data.msg
                    })
                } else {
                    this.$message.error(res.data.msg);
                }
            }).catch(err => {
                this.$message.error("服务器错误，稍等会再注册")
            });
        },

        // login method
        login() {
            this.$axios({
                method: "post",
                url: "/user/login",
                data: {
                    account: this.loginForm.account,
                    password: this.loginForm.password
                }
            }).then(res => {
                if (res.data.code == 200) {
                    //放入localStorage
                    /*localStorage适合浏览器历史记录和用过的用户名密码,而Cookie更适用于保持登录的状态,比如存储一个isLogin和登录用户的信息*/
                    // if(localStorage.getItem(this.userName) == null){
                    // 	localStorage.setItem(this.userName,this.password);
                    // }
                    this.$store.dispatch('setUser', res.data.data[0])
                    //这个是否登录可能需要存在cookie里
                    //路由转换
                    this.$router.push({path: '/'})
                } else {
                    this.$message.error(res.data.msg);
                }
            }).catch(res => {
                this.$message.error("服务器错误，稍等会再登录")
                console.log(res);
            });
        },
    },
    mounted() {
      this.refreshCode();
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

.vue-get-code::after {
    clear: both;
}

.vue-get-code.enable-countdown {
    cursor: not-allowed;
}

/* text */
#login-guide-reg {
    margin: 35px 0 22px 39px;
}

#login-guide-reg h3 {
    font-size: 28px;
    color: #000;
    padding-bottom: 4px;
}

#login-guide-reg p {
    font-size: 16px;
    color: #9B9B9B;
}

#login-guide-reg p #register {
    color: #2e58ff;
    cursor: pointer;
}

/* form */
.login-form {
    margin-top: 45px;
    padding-right: 10%;
}

.login-form .el-form-item {
    margin-top: 30px;
}

.login-form #loginButton {
    margin-top: 0px;
    width: 100%;
    border-radius: 18px;
}

#showPwd {
    cursor: pointer;
}

#showPwd:hover {
    color: #409eff;
}

#forgetpwd {
    margin-left: 60%;
    font-size: 12px;
    color: #2e58ff;
    cursor: pointer;
}

/deep/ #identifyCode .el-form-item__content {
    display: flex;
    .vue-get-code {
        width: 150px;
        margin-left: 20px;
        line-height: 50px;
    }
}

/* dialog */
/deep/ .el-dialog {
    border-radius: 12px;
}

/deep/ .el-dialog--center .el-dialog__body {
    padding: 25px 30px 30px 20px;
}

/* dialog body */
#reg-body #left {
    flex: 1;
}

#reg-body #mid {
    background: grey;
    opacity: 0.5;
    flex: 0.005;
    margin: 0 6%;
}

#reg-body #right {
    flex: 1;
    text-align: center;
}

#reg-body #right img {
    width: 300px;
    height: 250px;
}

.reg-dialog-footer {
    margin-left: 10%;
    button{
        width: 100%;
    }
}

/* dialog footer */
.dialog-footer {
    display: flex;
    margin-left: 37%;
}

.dialog-footer {
    margin-right: -4%;
}
</style>