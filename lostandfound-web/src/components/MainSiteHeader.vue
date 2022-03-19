<template>
    <div id="header">
        <div id="header-bar">
            <ul id="left-menu">
                <li>
                    <a href="/" id="home">
                        <!-- logo -->
                        <img src="../assets/image/login_backImg.jpeg" alt="">
                        <span>首页</span>
                    </a>
                </li>
                <li><a href="/"><span>失物招领</span></a></li>
                <li><a href="/findgoods"><span>寻物启事</span></a></li>
            </ul>
            <div id="header-search">
                <div id="search-bar">
                    <el-input placeholder="请输入查找关键字：物品名，姓名或证件号后四位" v-model="searchInput" class="input-with-select">
                        <el-button slot="append" icon="el-icon-search"></el-button>
                    </el-input>
                </div>
            </div>
            <ul id="right-menu">
                <li>
                    <el-dropdown @command="handleCommand">
                        <span class="el-dropdown-link">
                            我的发布<i class="el-icon-arrow-down el-icon--right"></i>
                        </span>
                        <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item command="findGoods">失物招领</el-dropdown-item>
                            <el-dropdown-item command="lostGoods">寻物启事</el-dropdown-item>
                        </el-dropdown-menu>
                    </el-dropdown>
                </li>
                <li class="el-icon-location-information location"><a @click="checkCity"><span>{{location}}</span></a></li>
                <li>
                    <div id="loginInfo">
                        <el-dropdown @command="handleCommand" v-if="this.$store.state.isLogin">
                            <span class="el-dropdown-link">
                                我的信息<i class="el-icon-arrow-down el-icon--right"></i>
                            </span>
                            <el-dropdown-menu slot="dropdown">
                                <el-dropdown-item command="personInfo">个人中心</el-dropdown-item>
                                <el-dropdown-item command="setting">设置</el-dropdown-item>
                                <el-dropdown-item command="quit">退出账号</el-dropdown-item>
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
            <img src="../assets/image/login_backImg.jpeg" alt="">
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            searchInput:"",
            location:"我的位置",
        }
    },
    methods: {
        handleCommand(command) {
            if(command == "personInfo"){
                this.$router.push('/accountInfo');
            }else if(command == 'setting'){
                console.log("setting")
            }else if(command == 'quit'){
                this.$store.state.isLogin = false;
            }else if(command == 'lostGoods'){
                console.log("lost")
            }else if(command == 'findGoods'){
                console.log("find")
            }else{
                this.$message({
                    message: command + ' is success',
                    type: 'success'
                });
            }
        },
        transLogin(){
            this.$router.push({path:'/login'})
        },
        checkCity(){
            
        }
    },
    mounted() {        
        // 获取当前位置
        this.$jsonp("https://apis.map.qq.com/ws/location/v1/ip", {
            key: "DFEBZ-FC3AU-A24VQ-2ZAAZ-AAGQK-ZHBZJ",
            output:'jsonp'
        }).then(res => {
            if(res.message == 'Success' || res.state == 0){
                console.log(res.result.ad_info);
                this.location = res.result.ad_info.city
            }
        }).catch(err => {
            console.log("catch", err);
        });
        // 获取全国地区
        this.$jsonp("https://apis.map.qq.com/ws/district/v1/list", {
            key: "DFEBZ-FC3AU-A24VQ-2ZAAZ-AAGQK-ZHBZJ",
            output:'jsonp'
        }).then(res => {
            if(res.message == 'query ok'){
                console.log(res.result);
            }
        }).catch(err => {
            console.log("catch", err);
        });
    },
}
</script>

<style lang="less" scoped>
    #header{
        min-height: 64px;
        position: relative;
        margin: 0 auto;
        width: 100%;
        background-color: grey;
        
        #header-bar{
            position: absolute;
            display: flex;
            align-items: center;
            z-index: 1;
            width: 100%;
            height: 64px;
            margin-top: 24px;
    
            /* left menu */
            #left-menu{
                margin-right: 5%;
                margin-left: 5%;
                display: flex;
                align-items: center;
                flex-shrink: 0;
                padding-left: 5%;

                #home{
                    display: flex;
                    align-items: center;
                    font-size: 14px;
                    cursor: pointer;
                    margin-right: 30px;

                    img{
                        height: 24px;
                        width: 24px;
                    }
                }

                li{
                    a{
                        height: 64px;
                        line-height: 64px;
                        font-size: 14px;
                        cursor: pointer;
                        margin-right: 15px;
                    }
                }
            }
            /* search */
            #header-search{
                flex: 1 auto;
                height: 38px;
                
                #search-bar{
                    position: relative;
                    margin: 0 auto;
                    min-width: 181px;
                    max-width: 600px;
                }
            }
            /* right menu */
            #right-menu{
                display: flex;
                align-items: center;
                margin-left: 5%;
                padding-right: 3%;

                li{
                    margin: 0 15px;
                    min-width: 25px;
                    display: block;
                    flex-shrink: 0;
                    margin-right: 4px;
                    text-align: center;
                    cursor: pointer;
                }
                .location{
                    width: 100px;
                }
                .el-icon-location-information a span{
                    font-weight: 500;
                }
            }
            
            span{
                font-weight: normal;
                font-size: 18px;
                color: white;
            }
        }

        /* banner */
        #header-banner{
            // position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            overflow: hidden;
            opacity: 0.81;
            height: 160px;
        
            img{
                width: 100%;
            }
        }

        /* login button */
        #loginInfo{
            width: 100px;
            margin-left: 20px;
        }
        #unLogin button{
            border-radius: 10px;
        }

        .el-icon-location-information:before{
            color: white;
            font-size: 18px;
            font-weight: 600;
        }
    }
</style>