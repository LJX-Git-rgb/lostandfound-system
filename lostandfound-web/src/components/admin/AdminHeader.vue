<template>
  <div id="header">
    <div id="logo">
        <a href="/">失物招领</a>
    </div>
    
    <div id="space"></div>
    
    <div id="rightTop"  v-if="this.$store.state.admin.adminIsLogin">
        <img src="../../assets/image/haha.jpeg" alt="" @click="toUserInfo">
        <div>
            <el-dropdown @command="handleCommand">
                <span class="el-dropdown-link">
                  {{ this.$store.state.admin.userName}}
                  <i class="el-icon-arrow-down el-icon--right"></i>
                </span>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item command="personInfo">个人中心</el-dropdown-item>
                  <el-dropdown-item command="setting">设置</el-dropdown-item>
                  <el-dropdown-item command="quit">退出账号</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
        </div>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    handleCommand(command) {
      if(command == "personInfo"){
        this.$router.push('/accountInfo');
      }else if(command == 'setting'){
        console.log("setting")
      }else {
        this.$router.push({path:'login'})
        this.$store.dispatch('quitLogin',"admin");
      }
    },
      toUserInfo(){
          this.$router.push({path:'myInfo'})
      }
  },
  data() {
    return {
    }
  },
}
</script>

<style lang="less" scoped>
    #header{
        height: 60px;
        line-height: 60px;
        border-bottom: 1px solid #ccc;
        display: flex;

        #logo {
            a{
                width: 200px;
                margin-left: 20px;
                font-weight: bold;
                font-size: 20px;
                color: #409EFF;
            }
        }
        #space{
            flex: 1;
        }
        #rightTop{
            display: flex;
            flex-direction: column;
            width: 100px;
            img{
                width: 30px;
                height: 30px;
                border-radius: 50%;
                margin: auto;
                cursor: pointer;
            }
            div{
                line-height: 0px;
                margin: auto;
            }
        }
  }

/* element-ui css */
 .el-dropdown-link {
    cursor: pointer;
    color: #409EFF;
  }
  .el-icon-arrow-down {
    font-size: 12px;
  }
</style>