<template>
    <div id="mainSite">
        <my-header/>
        <div id="body">
            <my-side/>
            <router-view></router-view>
        </div>
    </div>
</template>

<script>
import MyHeader from '../../components/admin/AdminHeader.vue'
import MySide from '../../components/admin/AdminSide.vue'

export default {
    components: {MySide, MyHeader},
    mounted() {
        //应该先判断管理员是否登录
        if (this.$store.state.admin.adminIsLogin == true) {
            this.$router.push({
                path: '/admin/allUser',
            })
        } else {
            this.$router.push({
                path: '/admin/login',
            })
        }
    },
}
</script>

<style lang="less" scoped>
#body {
    display: flex;
}
</style>