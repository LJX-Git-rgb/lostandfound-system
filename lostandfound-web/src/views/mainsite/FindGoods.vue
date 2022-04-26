<template>
    <div id="body">
        <div id="menu-class">
            <el-card shadow="hover">
                <h3>筛选条件 :</h3>
                <el-form>
                    <el-form-item>
                        <span>日期： </span>
                        <el-date-picker
                            v-model="timeRange"
                            type="daterange"
                            range-separator="至"
                            start-placeholder="开始日期"
                            end-placeholder="结束日期"
                            @blur="limitGoods">
                        </el-date-picker>
                    </el-form-item>
                    <el-form-item>
                        <span>类别： </span>
                        <el-select v-model="value" placeholder="请选择" id="type" @blur="limitGoods">
                            <el-option
                                v-for="item in options"
                                :key="item.value"
                                :label="item.label"
                                :value="item.value">
                            </el-option>
                        </el-select>
                    </el-form-item>
                </el-form>
            </el-card>
        </div>
        <div class="infinite-list-wrapper">
            <ul
                class="goodslist"
                v-infinite-scroll="load"
                infinite-scroll-disabled="disabled">
                <li v-for="index in rowCount" class="list-item" :key="index">
                    <goods-item :list="goodsList.slice( (index-1)*columnCount, index * columnCount )"></goods-item>
                </li>
            </ul>
            <p v-if="loading">加载中...</p>
            <p v-if="noMore">没有更多了</p>
        </div>
        <div id="footer"></div>
    </div>
</template>

<script>
import GoodsItem from "@/components/mainsite/goodsItem";

export default {
    components: {GoodsItem},
    data() {
        return {
            //筛选
            timeRange: '',
            options: [
                {
                    value: '食品',
                    label: '食品'
                }, {
                    value: '电子产品',
                    label: '电子产品'
                },
                {
                    value: '卡',
                    label: '卡'
                },
                {
                    value: '生活用品',
                    label: '生活用品'
                },
                {
                    value: '现金',
                    label: '现金'
                },],
            value: '',

            // 无限滚动展示
            loading: false,

            //展示
            begin:0,
            end:10,
            goodsList:[],

            //展示行数和列数
            rowCount:2,
            columnCount:5,

            //数据总数
            countFindGoods:0,
        }
    },
    computed: {
        noMore() {
            return this.goodsList.length == this.countFindGoods;
        },
        disabled() {
            return this.loading || this.noMore
        }
    },
    methods: {
        //请求记录总数,用作判断是否无限滚动到底
        findGoodsTotal(){
            this.$axios({
                url:'/api/generalgoods/countGoods',
                method:"get",
                params:{
                    flag: true
                }
            }).then(res=> {
                this.countFindGoods = res.data;
            }).catch(err=>{

            })

        },
        limitGoods(){
            this.$axios({
                method: "post",
                url:"/api/finds/limitByTimeAndType",
                data:{
                    foundTimeRange: JSON.stringify(this.timeRange),
                    tag: this.value
                }
            }).then(res => {
                if(res.data.code == 200){
                    this.goodsList = res.data;
                }
            }).catch(err => {
                this.$message.error("服务器错误,请稍后再操作");
            })
        },
        load() {
            this.loading = true
            setTimeout(() => {
                this.loading = false
                this.begin = this.end;
                this.end += 10;
                this.findGoodsList();
                this.rowCount+=2;
            }, 1000)
            this.$forceUpdate();
        },
        findGoodsList(){
            this.$axios({
                method: "get",
                url:"/api/finds/findLimit",
                params: {
                    begin : this.begin,
                    end : this.end
                }
            }).then(res => {
                if (res.status == 200 || res.statusText == "OK") {
                    if (this.goodsList == []) {
                        this.goodsList = res.data;
                    }else {
                        this.goodsList = this.goodsList.concat(res.data);
                    }
                }
            })
        }
    },
    mounted() {
        this.findGoodsTotal();
        this.findGoodsList();
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