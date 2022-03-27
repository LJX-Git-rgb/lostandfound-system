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
  components: { MySide, MyHeader },
}
</script>

<style scoped>
  #body{
    display: flex;
  }
</style>