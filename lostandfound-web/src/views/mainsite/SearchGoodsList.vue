<template>
    <div id="body">
                <li v-for="index in rowCount" class="list-item" :key="index">
                    <goods-item :list="goodsList.slice( (index-1)*columnCount, index * columnCount )"></goods-item>
                </li>
    </div>
</template>

<script>
import GoodsItem from "@/components/mainsite/goodsItem";

export default {
    components: {GoodsItem},
    data() {
        return {
            rowCount:2,
            columnCount:5,
            goodsList:[],
        }
    },
    methods: {
    },
    mounted() {
        console.log(this.$route.query)
        this.$axios({
            method:'get',
            url:this.$route.query.url,
            params:{
                searchInput: this.$route.query.searchInput,
            }
        }).then(res => {
            this.goodsList = res.data;
        }).catch(err => {
            console.log(res);
        })
    }
}
</script>

<style lang="less" scoped>
#body {
    background: -webkit-linear-gradient(to top, #ACB6E5, #74ebd5);
    background: linear-gradient(to top, #0a3442, #ACB6E5);
    overflow: auto;
    padding: 0px 5%;

    #menu-class {
        margin: 20px 70px;
        height: 170px;

        /deep/ .el-card.is-hover-shadow {
            height: 100%;
            background-color: rgba(255, 255, 255, 0.3);
        }

        h3 {
            margin-bottom: 10px;
        }

        /deep/ .el-form {
            width: 400px;
        }
    }

    .infinite-list-wrapper {
        margin-top: 3%;

        li {
            margin-bottom: 2%;
        }

        p {
            text-align: center;
            font-size: 20px;
            font-weight: 600;
            color: #cccccc;
            margin-top: 6%;
            margin-bottom: 1%;
            border-bottom: 2px solid #999999;
            opacity: .5;
        }
    }

    #footer {
        height: 180px;
    }
}
</style>