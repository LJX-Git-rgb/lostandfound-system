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
import MyHeader from '../components/MyHeader.vue'
import MySide from '../components/MySide.vue'

export default {
  components: { MySide, MyHeader },
}
</script>

<style scoped>
  #body{
    display: flex;
    flex-wrap: wrap;
  }
</style>