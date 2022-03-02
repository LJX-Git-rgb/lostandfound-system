<template>
    <div id="header">
        <div id="header-bar">
            <ul id="left-menu">
                <li>
                    <a href="" id="home">
                        <img src="../../public/image/login_backImg.jpeg" alt="">
                        <span>首页</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <span>嘿嘿嘿嘿嘿</span>
                    </a>
                </li>
                <li>
                    <a href="">
                    <span>端午活动</span>
                    </a>
                </li>
            </ul>
            <div id="header-search">
                <div id="search-bar">
                    <el-input placeholder="请输入内容" v-model="searchInput" class="input-with-select">
                        <el-button slot="append" icon="el-icon-search"></el-button>
                    </el-input>
                </div>
            </div>
            <ul id="right-menu">
                <li>
                    <a href="">
                    <span>端午活动</span>
                    </a>
                </li>
                <li>
                    <a href="">
                    <span>端午活动</span>
                    </a>
                </li>
                <li>
                    <a href="">
                    <span>端午活动</span>
                    </a>
                </li>
                <li>
                    <div id="loginInfo">
                        <el-dropdown @command="handleCommand" v-if="this.$store.state.isLogin">
                            <span class="el-dropdown-link">
                            我的信息
                            <i class="el-icon-arrow-down el-icon--right"></i>
                            </span>
                            <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item>个人中心</el-dropdown-item>
                            <el-dropdown-item>设置</el-dropdown-item>
                            <el-dropdown-item>退出账号</el-dropdown-item>
                            </el-dropdown-menu>
                        </el-dropdown>
                        
                        <div id="unLogin" v-if="!this.$store.state.isLogin">
                            <el-button type="primary" @click="transLogin" size = "small">点我登录</el-button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div id="header-banner">
            <img src="../../public/image/login_backImg.jpeg" alt="">
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            searchInput:""
        }
    },
    methods: {
        transLogin(){
            this.$router.push({path:'/login'})
        }
    }
}
</script>

<style scoped>
    #header{
        min-height: 64px;
        position: relative;
        margin: 0 auto;
        width: 100%;
        background-color: grey;
    }
    #header #header-bar{
        position: absolute;
        display: flex;
        align-items: center;
        z-index: 1;
        width: 100%;
        height: 64px;
    }
    
    /* left menu */
    #left-menu{
        margin-right: 10px;
        display: flex;
        align-items: center;
        flex-shrink: 0;
        padding-left: 5%;
    }
    #left-menu a{
        height: 64px;
        line-height: 64px;
        font-size: 14px;
        cursor: pointer;
        margin-right: 15px;
    }
    #left-menu #home{
        display: flex;
        align-items: center;
        font-size: 14px;
        cursor: pointer;
        margin-right: 30px;
    }
    #home img{
        height: 20px;
        width: 20px;
    }
   
   /* search */
    #header-search{
        flex: 1 auto;
        height: 38px;
    }
    #search-bar{
        position: relative;
        margin: 0 auto;
        min-width: 181px;
        max-width: 600px;
    }

    /* right menu */
    #right-menu{
        display: flex;
        align-items: center;
        margin-left: 10px;
        padding-right: 3%;
    }
    #right-menu li{
        margin: 0 3px;
        min-width: 25px;
        display: block;
        flex-shrink: 0;
        margin-right: 4px;
        text-align: center;
        cursor: pointer;
    }

    /* banner */
    #header-banner{
        background-color: green;
        /* position: absolute; */
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        overflow: hidden;
        opacity: 1;
        height: 160px;
    }
    /* #header-banner img{
        width: 100%;
        height: 160px;
    } */

    /* login button */
    #loginInfo{
        width: 100px;
        margin-left: 20px;
    }
    #unLogin button{
        border-radius: 10px;
    }

    a span{
        font-weight: normal;
        font-size: 16px;
        color: white;
    }
</style>