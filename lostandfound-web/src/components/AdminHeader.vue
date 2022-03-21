<template>
  <div id="header">
    <div id="logo">失物招领</div>
    
    <div id="space"></div>
    
    <div id="rightTop">
      <el-dropdown @command="handleCommand" v-if="this.$store.state.adminIsLogin">
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
    </div>
    
  </div>
</template>

<script>
export default {
  methods: {
    handleCommand(command) {
      this.$message('click on item ' + command);
    },

    transLogin(){
      this.$router.push({path:'/login'})
    }
  },
  data() {
    return {
    }
  },
}
</script>

<style scoped>
  #header{
    height: 50px;
    line-height: 50px;
    border-bottom: 1px solid #ccc;
    display: flex;
  }
  #logo{
    width: 200px;
    margin-left: 20px;
    font-weight: bold;
    color: #409EFF;
  }
  #space{
    flex: 1;
  }
  #rightTop{
    width: 100px;
  }
  #unLogin button{
    border-radius: 12px;
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