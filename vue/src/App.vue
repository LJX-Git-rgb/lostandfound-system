<template>
  <div id="app">
    <my-header/>
    <router-view></router-view>
  </div>
</template>

<script>
import MyHeader from './components/MyHeader.vue'

export default {
  components: { MyHeader },
}

</script>

<style scoped>
</style>
