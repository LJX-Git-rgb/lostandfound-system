<template>
    <div id="mainsite-body">
        <div id="menu-class">
        </div>
<!--        轮播图和分类展示-->
        <div id="carousel-and-filter">
            <div id="carousel-wrap">
                <el-carousel :interval="5000">
                    <el-carousel-item v-for="(item,index) in imgList" :key="index">
                        <img :src=item.url alt="">
                    </el-carousel-item>
                </el-carousel>
            </div>
            <ul id="filter-menu">
                <li>
                    <div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
                    <div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
                    <div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
                    <div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
                </li>
                <li>
                    <div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
                    <div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
                    <div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
                    <div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
                </li>
            </ul>
        </div>
<!--        分类展示-->
        <div id="class-goods">
            <div id="lost-goods">
                <span>最新寻物启事:<a @click="$router.push({path:'/lostgoods'})" class="el-icon-right">查看更多</a></span>
                <goods-item/>
            </div>
            <div id="find-goods">
                <span>最新失物招领: <a class="el-icon-right" @click="$router.push({path:'/findgoods'})">查看更多</a></span>
                <goods-item/>
            </div>
        </div>
<!--        底部-->
        <div id="footer"></div>
    </div>
</template>

<script>
import goodsItem from '../../components/mainsite/goodsItem.vue'
import FindGoods from "@/views/mainsite/FindGoods";

export default {
    components: {FindGoods, goodsItem},
    data() {
        return {
            timeRange: '',
            options: [{
                value: '选项1',
                label: '黄金糕'
            }, {
                value: '选项2',
                label: '双皮奶'
            }],
            value: '',


            // 轮播图
            imgFolder: '',
            imgList: [
                {
                    url: require('../../assets/image/haha.jpeg'),
                    alt: 'haha'
                },
                {
                    url: require('../../assets/image/login_backImg.jpeg'),
                    alt: 'heihei'
                },
            ]
        }
    },
    computed: {
    },
    methods: {
    },
    mounted() {
        //调用axios请求最新的物品数据
        // this.$axios({
        //     method: "post",
        //     url: "/user/add",
        //     data: {
        //         email : this.regForm.email,
        //         password : this.regForm.password
        //     }
        // }).then(res => {
        //     this.form = {}
        //     if (res.data.code == 200) {
        //         this.$message({
        //             type: 'success',
        //             message: res.data.msg
        //         })
        //     } else {
        //         this.$message.error(res.data.msg);
        //     }
        // }).catch(err => {
        //     this.$message.error("服务器错误，稍等会再注册")
        // });
    }
}
</script>

<style lang="less" scoped>
#mainsite-body {
    padding: 0 6%;
    background: #74ebd5;
    background: -webkit-linear-gradient(to top, #ACB6E5, #74ebd5);
    background: linear-gradient(to top, #0a3442, #ACB6E5);
    overflow: auto;

    #menu-class {
        margin: 20px 0px;
        width: 100%;
        height: 10px;

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

    #carousel-and-filter {
        height: 300px;
        display: flex;

        #carousel-wrap {
            flex: 0.7;

            .el-carousel__item h3 {
                color: #475669;
                font-size: 18px;
                opacity: 0.75;
                line-height: 100%;
            }

            .el-carousel__item {
                img {
                    width: 100%;
                    height: 100%;
                }
            }
        }

        #filter-menu {
            margin-left: 30px;
            flex: 1;

            li {
                height: 50%;
                width: 100%;
                text-align: center;
                display: flex;

                div {
                    flex: 1;
                    margin-right: 3%;
                    margin-top: 1.5%;

                    img {
                        width: 100%;
                        height: 80%;
                    }
                }
            }
        }
    }

    #class-goods {
        margin-top: 30px;
        border: #9B9B9B;

        #lost-goods, #find-goods {
            margin-top: 3%;

            span {
                font-size: 24px;
                color: #ffffff;
                margin-bottom: 1%;
                display: block;
                padding-right: 70px;

                a {
                    float: right;
                    font-size: 18px;
                    color: #cccccc;
                    line-height: 33px;
                    cursor: pointer;
                }
            }

            #goods-list {
                li {
                    margin-bottom: 2%;
                }
            }
        }
    }

    #footer {
        margin-top: 7%;
        height: 100px;
        border: 1px solid red;
    }
}
</style>
