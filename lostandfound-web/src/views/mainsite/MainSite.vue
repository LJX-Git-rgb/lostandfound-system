未完成
  1. logo
  2. 登录按钮的样式
  3. 登录后需要展示头像
  4. 点击我的位置可以选择并更改为其他城市
  5. 点击登录后的登录状态需要持续性存储，cookie or session or localStrage
  6. 替换图片为数据库中的数据
  7. 一些内容的布局，比如物品详细信息，个人详细信息
  8. 退出账号（改变登录状态就行，很简单）
  
  大问题
    1. 我的发布，两块布局（比较费脑子，用组件）
    2. 修改为响应式布局（尽量）
    3. 查询功能，关键字查询，名字查询，证件号查询（很适合熟悉项目流程）
    4. 权限管理（目前还没想好使用在前后端哪里，有待讨论，并且很鸡肋，全当凑功能）
    5. 个人设置的内容（有待讨论一下都是什么）

<template>
  <div id="mainSite">
    <main-site-header/>
    <router-view></router-view>
    <!-- <vue-canvas-nest></vue-canvas-nest> -->
  </div>
</template>

<script>
import MainSiteHeader from '../../components/mainsite/MainSiteHeader.vue';
import vueCanvasNest from '../../../node_modules/vue-canvas-nest/src/vueCanvasNest.vue'

export default {
  components: { MainSiteHeader,vueCanvasNest }
}

</script>

<style scoped>
 
</style>