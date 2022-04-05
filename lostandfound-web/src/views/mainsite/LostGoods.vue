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
                            end-placeholder="结束日期">
                        </el-date-picker>
                    </el-form-item>
                    <el-form-item>
                        <span>类别： </span>
                        <el-select v-model="value" placeholder="请选择" id="type">
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
                <li v-for="i in count" class="list-item" :key="i">
                    <goods-item/>
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
    data(){
        return{
            // 无限滚动展示
            count: 3,
            loading: false,
        }
    },
    computed: {
        noMore () {
            return this.count >= 4
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
        },
    },
}

</script>

<style lang="less" scoped>
#body {
    background: -webkit-linear-gradient(to top, #ACB6E5, #74ebd5);
    background: linear-gradient(to top, #0a3442,#ACB6E5);
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

    #footer{
        height: 180px;
    }
}
</style>