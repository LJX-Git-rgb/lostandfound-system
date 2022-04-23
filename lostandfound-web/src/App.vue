<template>
    <router-view></router-view>
</template>

<script>
export default {
    created() {
        //将持久化的数据放回vuex
        var item = window.localStorage.getItem("vueX");
        if (item != null) {
            if (item.user != null) {
                this.$store.dispatch("setUser", item.user);
            }
            if (item.admin != null) {
                this.$store.dispatch("setAdmin", item.admin);
            }
        }
    }
}
</script>

<style lang="less">
    *{
        padding: 0px;
        margin: 0px;
    }
    a{
        color: black;
        text-decoration: none;
    }
    li{
        list-style-type: none;
    }
</style>