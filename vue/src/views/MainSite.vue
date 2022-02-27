<template>
      <div id="body">
      <my-side/>
      <router-view></router-view>
    </div>
</template>

<script>
import MySide from '../components/MySide.vue'

export default {
  components: { MySide },
}
</script>

<style scoped>
    #body{
        display: flex;
    }
</style>