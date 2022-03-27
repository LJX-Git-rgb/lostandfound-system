<template>
    <el-menu
        default-active="1"
        class="el-menu-vertical-demo"
        @open="handleOpen"
        @close="handleClose"
        @select="handleSelect">

        <el-submenu index="account/">
            <template slot="title"><i class="el-icon-s-custom"></i>用户信息管理</template>
            <el-menu-item index="allUser">选项1</el-menu-item>
            <el-menu-item index="2-2">选项2</el-menu-item>
            <el-menu-item index="2-3">选项3</el-menu-item>
            <el-submenu index="2-4">
                <template slot="title">选项4</template>
                <el-menu-item index="2-4-1">选项1</el-menu-item>
                <el-menu-item index="2-4-2">选项2</el-menu-item>
                <el-menu-item index="2-4-3">选项3</el-menu-item>
            </el-submenu>
        </el-submenu>

       <el-submenu index="findGoods">
            <template slot="title"><i class="el-icon-message-solid"></i>寻物启事管理</template>
            <el-menu-item index="2-1">选项1</el-menu-item>
            <el-menu-item index="2-2">选项2</el-menu-item>
            <el-menu-item index="2-3">选项3</el-menu-item>
        </el-submenu>
        <el-submenu index="lostGoods">
            <template slot="title"><i class="el-icon-message-solid"></i>失物招领管理</template>
            <el-menu-item index="2-1">选项1</el-menu-item>
            <el-menu-item index="2-2">选项2</el-menu-item>
            <el-menu-item index="2-3">选项3</el-menu-item>
        </el-submenu>
        <el-submenu index="announcement">
            <template slot="title"><i class="el-icon-s-comment"></i>公告管理</template>
            <el-menu-item index="2-1">选项1</el-menu-item>
            <el-menu-item index="2-2">选项2</el-menu-item>
            <el-menu-item index="2-3">选项3</el-menu-item>
        </el-submenu>
        <el-submenu index="myInfo">
            <template slot="title"><i class="el-icon-s-cooperation"></i>我的信息</template>
            <el-menu-item index="2-1">选项1</el-menu-item>
            <el-menu-item index="2-2">选项2</el-menu-item>
            <el-menu-item index="2-3">选项3</el-menu-item>
        </el-submenu>
    </el-menu>
</template>

<script>
export default {
    methods: {
        handleOpen(index, keyPath) {
            console.log("open: ",index, keyPath);
        },
        handleClose(index, keyPath) {
            console.log("close: ",index, keyPath[keyPath.length-1]);
        },
        handleSelect(index, keyPath) {
           //根据index进行路由跳转
           this.$router.push({path:index})
        }
    }
}
</script>

<style scoped>

/* element-ui css */
 .el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 200px;
    /* 高度为整个页面 */
    min-height: calc(100vh - 50px); 
  }
</style>