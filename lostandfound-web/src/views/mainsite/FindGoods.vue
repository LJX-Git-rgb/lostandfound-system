<template>
    <div id="body">
        <div class="infinite-list-wrapper" style="overflow:auto">
            <ul
                class="goodslist"
                v-infinite-scroll="load"
                infinite-scroll-disabled="disabled"
            >
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
import GoodsItem from "@/components/mainsite/goodsItem";
export default {
    components: {GoodsItem},
    data(){
        return{
            // 无限滚动展示
            count: 3,
            loading: false,
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
            // setTimeout(() => {
            // 	this.count += 2
            // 	this.loading = false
            // }, 2000)
        },
    },
}

</script>

<style lang="less" scoped>

</style>