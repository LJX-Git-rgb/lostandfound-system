<template>
    <div id="header">
        <div id="header-bar">
            <ul id="left-menu">
                <li>
                    <a @click="$router.push({path:'/'})" id="home">
                        <!-- logo -->
                        <img src="../../assets/image/logo.png" alt="">
                        <span>首页</span>
                    </a>
                </li>
                <li><a @click="$router.push({path:'/findgoods'})"><span>失物招领</span></a></li>
                <li><a @click="$router.push({path:'/lostgoods'})"><span>寻物启事</span></a></li>
            </ul>
            <div id="header-search">
                <div id="search-bar">
                    <el-input placeholder="请输入查找关键字：物品名，姓名或证件号后四位" v-model="searchInput" class="input-with-select">
                      <el-select v-model="type" slot="prepend" placeholder="请选择" style="width: 110px">
                        <el-option label="失物招领" value="lost"></el-option>
                        <el-option label="寻物启事" value="find"></el-option>
                      </el-select>
                        <el-button slot="append" icon="el-icon-search"  @click="searchByText"></el-button>
                    </el-input>
                </div>
            </div>
            <ul id="right-menu">
                <li class="upload"><a @click="toPost"><span>我要发布</span></a></li>
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
                <li class="location">
                    <el-popover
                        width="100"
                        trigger="click"
                    >
                        <div id="changeCity">
                            <el-select
                                v-model="searchLocation"
                                filterable
                                remote
                                placeholder="请输入市区名"
                                :remote-method="remoteMethod">
                                <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                                </el-option>
                            </el-select>
                            <el-button @click="changeCity">更改</el-button>
                        </div>
                        <a class="el-icon-location-information " slot="reference">
                            <span>{{ location }}</span>
                        </a>
                    </el-popover>
                </li>
                <li>
                    <div id="loginInfo">
                        <div v-if="this.$store.state.user.isLogin" id="userImg">
                            <img v-if='this.$store.state.user.face.split("/")[1] != "face"' :src="this.$store.state.user.face"  @click="$router.push({path: 'accountInfo'})"/>
                            <img v-if='this.$store.state.user.face.split("/")[1] == "face"' :src="require('../../../../lostandfound-miniprogram/src/static/image' + this.$store.state.user.face)"  @click="$router.push({path: 'accountInfo'})"/>
                            <div>
                                <el-dropdown @command="handleCommand">
                                    <span class="el-dropdown-link">
                                        {{ $store.state.user.nickName }}<i
                                        class="el-icon-arrow-down el-icon--right"></i>
                                    </span>
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item command="personInfo">个人中心</el-dropdown-item>
<!--                                        <el-dropdown-item command="logout">注销</el-dropdown-item>-->
                                        <el-dropdown-item command="quit">退出账号</el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>
                            </div>
                        </div>

                        <div id="unLogin" v-if="!this.$store.state.user.isLogin">
                            <el-button type="primary" @click="$router.push({path:'/login'})" size="small">点我登录
                            </el-button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div id="header-banner">
            <img src="../../assets/image/login_backImg.jpeg" alt="">
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            searchInput: "",     //查询框的输入
            location: "我的位置", //地址
            isdis: false,
            searchLocation: "",  //搜索地址框的输入
            states: [],
            list: [],           //所有市级地址
            options: [],        //查询地址框匹配的地址
            type:''
        }
    },
    methods: {
        remoteMethod(query) {
            if (query !== '') {
                this.loading = true;
                setTimeout(() => {
                    this.loading = false;
                    this.options = this.list.filter(item => {
                        return item.label.toLowerCase()
                            .indexOf(query.toLowerCase()) > -1;
                    });
                }, 200);
            } else {
                this.options = [];
            }
        },

        handleCommand(command) {
            if (command == "personInfo") {
                this.$router.push('/accountInfo');
            } else if (command == 'quit') {
                console.log("quit")
                this.$store.dispatch('quitLogin', "user");
            } else if (command == 'lostGoods') {
                if (this.$store.state.user.isLogin) {
                    this.$router.push({path: '/mypost?lost'})
                }else{
                    this.$message.error("您需要先登录")
                    this.$router.push({path: '/login'})
                }
            } else if (command == 'findGoods') {
                if (this.$store.state.user.isLogin) {
                    this.$router.push({path: '/mypost?find'})
                }else{
                    this.$message.error("您需要先登录")
                    this.$router.push({path: '/login'})
                }
            } else {
                this.$message({
                    message: command + ' is success',
                    type: 'success'
                });
            }
        },
        changeCity() {
            if (this.searchLocation != '') {
                this.location = this.searchLocation;
                this.$store.dispatch('setLocation',this.location);
            }
        },

        searchByText(){
          let url;
          if (this.type == "find") {
            url = '/api/finds/search'
          }else{
            url = '/api/losts/search'
          }
           this.$router.push({path:'search',query:{url:url, searchInput:this.searchInput}})
        },

        toPost(){
            if (this.$store.state.user.isLogin) {
              if(this.$store.state.user.userRole == 3){
                this.$message.error("您已被禁言了，请联系管理员")
              }else{
                this.$router.push({path: '/upload'})
              }
            }else{
                this.$message.error("您需要先登录")
                this.$router.push({path: '/login'})
            }
        }
    },
    mounted() {
        // 获取当前位置
        this.$jsonp("https://apis.map.qq.com/ws/location/v1/ip", {
            key: "DFEBZ-FC3AU-A24VQ-2ZAAZ-AAGQK-ZHBZJ",
            output: 'jsonp'
        }).then(res => {
            console.log(res)
            if (res.message == 'Success' || res.status == 0) {
                if (this.location == "我的位置") {
                    this.location = res.result.ad_info.city
                    this.$store.dispatch('setLocation',this.location);
                }
            } else{
                this.$message.error(res.message+"，  请手动更换地址")
            }
        }).catch(err => {
            console.log("catch： ", err);
        });

        // 获取全国地区
        //当local里面有记录时，读取到data中
        if (window.localStorage.getItem("area") != null) {
            this.list = JSON.parse(localStorage.getItem("area"))
        }
        //否则请求获取全国地区
        else {
            this.$jsonp("https://apis.map.qq.com/ws/district/v1/list", {
                key: "DFEBZ-FC3AU-A24VQ-2ZAAZ-AAGQK-ZHBZJ",
                output: 'jsonp'
            }).then(res => {
                if (res.message == 'query ok') {
                    //将全国地区里面的 *市 *地区一类行政区保存到states中
                    var k = 0;
                    for (var i = 0; i < 3; i++) {
                        for (var j = 0; j < res.result[i].length; j++) {
                            if (res.result[i][j].fullname.includes("市") || res.result[i][j].fullname.includes("地区")) {
                                this.states[k++] = res.result[i][j].fullname;
                            }
                        }
                    }
                    //将states数组保存为有value和label的对象
                    this.list = this.states.map(item => {
                        return {value: `${item}`, label: `${item}`};
                    });
                    //将数据写入local
                    window.localStorage.setItem("area", JSON.stringify(this.list));
                }
            }).catch(err => {
                console.log("catch", err);
            });
        }
    },
}
</script>

<style lang="less" scoped>
#header {
    min-height: 64px;
    position: relative;
    margin: 0 auto;
    width: 100%;
    background-color: grey;

    #header-bar {
        position: absolute;
        display: flex;
        align-items: center;
        z-index: 1;
        width: 100%;
        height: 64px;
        margin-top: 24px;

        /* left menu */

        #left-menu {
            margin-right: 2%;
            //margin-left: 5%;
            display: flex;
            align-items: center;
            flex-shrink: 0;
            padding-left: 5%;

            #home {
                display: flex;
                align-items: center;
                font-size: 14px;
                cursor: pointer;
                margin-right: 30px;

                img {
                    height: 50px;
                    width: 50px;
                }
            }

            li {
                a {
                    height: 64px;
                    line-height: 64px;
                    font-size: 14px;
                    cursor: pointer;
                    margin-right: 15px;
                }
            }
        }

        /* search */


      .input-with-select .el-input-group__prepend {
        background-color: #fff;
      }

        #header-search {
            flex: 1 auto;
            height: 38px;

            #search-bar {
                position: relative;
                margin: 0 auto;
                min-width: 181px;
                max-width: 600px;
            }
        }

        /* right menu */

        #right-menu {
            display: flex;
            align-items: center;
            margin-left: 2%;
            padding-right: 4%;

            li {
                margin: 0 15px;
                min-width: 25px;
                display: block;
                flex-shrink: 0;
                margin-right: 4px;
                text-align: center;
                cursor: pointer;
            }

            .location {
                width: 100px;
            }

            .el-icon-location-information a span {
                font-weight: 500;
            }
        }

        span {
            font-weight: normal;
            font-size: 18px;
            color: white;
        }
    }

    /* banner */

    #header-banner {
        // position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        overflow: hidden;
        opacity: 0.81;
        height: 160px;

        img {
            width: 100%;
        }
    }

    /* login button */

    #loginInfo {
        #userImg {
            display: flex;
            flex-direction: column;
            width: 100px;

            img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin: auto;
                cursor: pointer;
            }

            div {
                line-height: 0px;
                margin: auto;
                margin-top: 1px;
            }
        }
    }

    #unLogin button {
        border-radius: 10px;
    }

    .el-icon-location-information:before {
        color: white;
        font-size: 18px;
        font-weight: 600;
    }
}

#changeCity .el-button.el-button--default {
    width: 100%;
    background-color: #409eff;
    color: #ffffff;
    margin-top: 5px;
}
.el-dropdown-link{
    font-size: 14px !important;
}
</style>