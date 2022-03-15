<template>
  <div id="mainSite">
    <main-site-header/>
    <router-view></router-view>
    <!-- <vue-canvas-nest></vue-canvas-nest> -->
  </div>
</template>

<script>
import MainSiteHeader from '../../components/MainSiteHeader.vue';
import vueCanvasNest from '../../../node_modules/vue-canvas-nest/src/vueCanvasNest.vue'

export default {
  components: { MainSiteHeader,vueCanvasNest }
}

</script>

<style scoped>
 
</style>