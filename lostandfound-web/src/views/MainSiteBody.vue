<template>
  <div id="mainsite-body">
    <div id="menu-class">
      <ul>
        <li>haha1</li>
        <li>haha2</li>
        <li>haha3</li>
      </ul>
    </div>
    <div class="infinite-list-wrapper" style="overflow:auto">
      <ul
        class="list"
        v-infinite-scroll="load"
        infinite-scroll-disabled="disabled">
        <li v-for="i in count" class="list-item" :key="i">
          <goods-item/>
        </li>
      </ul>
      <p v-if="loading">加载中...</p>
      <p v-if="noMore">没有更多了</p>
    </div>
  </div>
</template>

<script>
import goodsItem from '../components/goodsItem.vue'
export default {
  components: { goodsItem },
  data () {
    return {
      count: 10,
      loading: false
    }
  },
  computed: {
    noMore () {
      return this.count >= 20
    },
    disabled () {
      return this.loading || this.noMore
    }
  },
  methods: {
    load () {
      this.loading = true
      setTimeout(() => {
        this.count += 2
        this.loading = false
      }, 2000)
    }
  }
}
</script>

<style scoped>
  #mainsite-body{
    padding: 0 10%;
  }
  #menu-class{
    background-color: red;
    height: 200px;
  }
  .infinite-list-wrapper{
    border: 1px solid black;
  }
</style>