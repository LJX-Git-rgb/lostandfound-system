<template>
    <el-menu
        default-active="2"
        class="el-menu-vertical-demo"
        @open="handleOpen"
        @close="handleClose">

        <el-menu-item index="1">
                <i class="el-icon-location"></i>
                <span>用户管理</span>
        </el-menu-item>

        <el-menu-item index="2">
            <i class="el-icon-menu"></i>
            <span slot="title">失物招领管理</span>
        </el-menu-item>
        
        <el-menu-item index="3">
            <i class="el-icon-setting"></i>
            <span slot="title">寻物启事管理</span>
        </el-menu-item>
        
        <el-menu-item index="3">
            <i class="el-icon-setting"></i>
            <span slot="title">公告管理</span>
        </el-menu-item>
    </el-menu>
</template>

<script>
export default {
    methods: {
        handleOpen(key, keyPath) {
            console.log(key, keyPath);
        },
        handleClose(key, keyPath) {
            console.log(key, keyPath);
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