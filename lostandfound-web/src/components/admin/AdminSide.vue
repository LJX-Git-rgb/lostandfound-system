<template>
    <el-menu
        default-active="1"
        class="el-menu-vertical-demo"
        router>

        <el-menu-item index="allUser" :disabled="this.adminLogin == false || this.adminLogin == null">
            <template slot="title"><i class="el-icon-s-custom"></i>用户信息管理</template>
        </el-menu-item>

        <el-menu-item index="findGoods" :disabled="this.adminLogin == false  || this.adminLogin == null">
            <template slot="title"><i class="el-icon-message-solid"></i>寻物启事管理</template>
        </el-menu-item>

        <el-menu-item index="lostGoods" :disabled="this.adminLogin == false  || this.adminLogin == null">
            <template slot="title"><i class="el-icon-message-solid"></i>失物招领管理</template>
        </el-menu-item>

        <el-menu-item index="announcement" :disabled="this.adminLogin == false  || this.adminLogin == null">
            <template slot="title"><i class="el-icon-s-comment"></i>公告管理</template>
        </el-menu-item>

        <el-menu-item index="rightsManege" :disabled="this.adminLogin == false  || this.adminLogin == null">
            <template slot="title"><i class="el-icon-s-cooperation"></i>管理员权限管理</template>
        </el-menu-item>

        <el-menu-item index="adminInfo" :disabled="this.adminLogin == false || this.adminLogin == null">
            <template slot="title"><i class="el-icon-s-cooperation"></i>我的信息</template>
        </el-menu-item>
    </el-menu>
</template>

<script>
export default {
    computed: {
        adminLogin() {
            return this.$store.state.admin.adminIsLogin;
        }
    },
    data() {
        return {
        }
    },
    methods: {}
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