<template>
    <el-menu
        background-color="#545c64"
        text-color="#fff"
        active-text-color="#ffd04b"
        :default-active="path"
        class="el-menu-vertical-demo"
        router>

        <el-menu-item index="user" :disabled="this.adminLogin == false || this.adminLogin == null">
            <template slot="title"><i class="el-icon-s-custom"></i>用户信息管理</template>
        </el-menu-item>

        <el-menu-item index="goods?lost" :disabled="this.adminLogin == false  || this.adminLogin == null">
            <template slot="title"><i class="el-icon-message-solid"></i>寻物启事管理</template>
        </el-menu-item>

        <el-menu-item index="goods?find" :disabled="this.adminLogin == false  || this.adminLogin == null">
            <template slot="title"><i class="el-icon-message-solid"></i>失物招领管理</template>
        </el-menu-item>

        <el-menu-item index="notice" :disabled="this.adminLogin == false  || this.adminLogin == null">
            <template slot="title"><i class="el-icon-s-comment"></i>公告管理</template>
        </el-menu-item>

        <el-menu-item index="feedback" :disabled="this.adminLogin == false || this.adminLogin == null">
          <template slot="title"><i class="el-icon-s-cooperation"></i>举报管理</template>
        </el-menu-item>

        <el-menu-item index="myInfo" :disabled="this.adminLogin == false || this.adminLogin == null">
          <template slot="title"><i class="el-icon-s-cooperation"></i>管理员信息</template>
        </el-menu-item>

        <el-menu-item index="rightsManege" :disabled="this.adminLogin == false  || this.adminLogin == null">
            <template slot="title"><i class="el-icon-s-cooperation"></i>管理员权限管理</template>
        </el-menu-item>

    </el-menu>
</template>

<script>
export default {
  name:"",
  data(){
    return{
      path:this.$route.path  //设置默认高亮菜单
    }
  },
    computed: {
        adminLogin() {
            return this.$store.state.admin.adminIsLogin;
        }
    },
}
</script>

<style lang="less" scoped>

/* element-ui css */
.el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 200px;
    /* 高度为整个页面 */
    min-height: calc(100vh - 50px);
}
</style>