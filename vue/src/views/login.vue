<template>
    <div id="loginForm">
      <h2>用户登录</h2>
      <el-form label-width="80px">
        <!-- 可以用图标代替文字 -->
        <el-form-item label="用户名: ">
          <el-input v-model="userName"></el-input>
        </el-form-item>
        <el-form-item label="密码: ">
          <el-input v-model="password"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" id="loginButton" @click="login">登录</el-button>
        </el-form-item>
      </el-form>
    </div>
</template>

<script>
import axios from 'axios';
export default {
  data() {
    return {
      userName: '',
      password: '',
    };
  },
  methods:{
    login(){
      axios({
        method: "post",
        url: "/user/login",
        data: {
          userName: this.userName,
          password: this.password
        }
      }).then(res => {
        if(res.data.code == 200){
          this.$store.dispatch('setUser',res.data.data)
          //这个是否登录可能需要存在cookie里
          this.$store.commit('setIsLogin',true);
          //放入cookie和浏览器历史
          //路由转换
          this.$router.push({path:'/mainSite/allUser'})
        }
        else{
          this.$message.error(res.data.msg);
        }
      }).catch(res => {
        this.$message.error("服务器错误，稍等会再登录")
        console.log(res);
      });
   
    }
  }
}
</script>

<style scoped>
  #loginForm{
    margin: 10% 30% 0 30%;
  }
  h2{
    margin-left: 45%;
  }
  .el-form-item{
    margin-top: 10px;
  }

  #loginButton{
    width: 100%;
  }
 
</style>