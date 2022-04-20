<!--
    明天主要任务
    1. 点我发布和我的发布进行登录的路由监听
    2. 想终止无限加载的条件
    3. 失物招领和寻物启事进行一下合并,使用一个路由进行不同参数判定
    4. 根据物品title, desc, 类别进行查询展示在物品详细信息的右边(五个)

    其他任务
    1. 填充数据库的用户 详细联系信息表 user_contact_info
    2. 在个人信息里面加个身份认证功能,数据库加身份证字段或者身份证照片路径字段
    3. 在点击认领失物时判定是否已经实名认证了,然后将用户联系方式展示出来就可以(并且限制一人一天只能认领一个)
-->

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
                    <div v-for="item in foundGoods.slice(0,5)" :key="item.id">
                        <a @click="$router.push({path:'/'})">
                            <img :src= "require('../../../../image' + item.imageList[0])" alt="" v-if="item.image != '' ">
                            <span>{{ item.title }}</span>
                        </a>
                    </div>
                </li>
                <li>
                    <div v-for="item in lostGoods.slice(0,5)" :key="item.id">
                        <a @click="$router.push({path:'/'})">
                            <img :src= "require('../../../../image' + item.imageList[0])" alt="">
                            <span>{{ item.title }}</span></a>
                    </div>
                </li>
            </ul>
        </div>
<!--        分类展示-->
        <div id="class-goods">
            <div id="lost-goods">
                <span>最新失物招领:<a @click="$router.push({path:'/findgoods'})" class="el-icon-right">查看更多</a></span>
                <template v-for="index in rowCount">
                    <goods-item :list="foundGoods.slice( (index-1)*columnCount, index*columnCount )"></goods-item>
                </template>
            </div>
            <div id="find-goods">
                <span>最新寻物启事: <a class="el-icon-right" @click="$router.push({path:'/lostgoods'})">查看更多</a></span>
                <template v-for="index in rowCount">
                    <goods-item :list="lostGoods.slice( (index-1)*columnCount, index*columnCount )"></goods-item>
                </template>
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
            //分页获取数据
            begin:0,
            end:10,

            //数据集--存储前10个数据
            foundGoods:[],
            lostGoods:[],

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
            ],

            //展示行数和列数
            rowCount:2,
            columnCount:5
        }
    },
    mounted() {
        // 调用axios请求最新的物品数据
        this.$axios({
            method: "get",
            url: "/finds/findLimit",
            params: {
                begin : this.begin,
                end : this.end
            }
        }).then(res => {
            if (res.status == 200 || res.statusText == "OK"){
                this.foundGoods = res.data;
            }
        }).catch(err => {
        });

        this.$axios({
            method: "get",
            url: "/losts/lostLimit",
            params: {
                begin : this.begin,
                end : this.end
            }
        }).then(res => {
            if (res.status == 200 || res.statusText == "OK"){
                this.lostGoods = res.data;
            }
        }).catch(err => {
        });
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
                    a{
                        img {
                            width: 100%;
                            height: 80%;
                        }
                        span{
                            overflow:hidden;//超出一行文字自动隐藏
                            text-overflow:ellipsis;//文字隐藏后添加省略号
                            white-space:nowrap;//强制不换行
                        }
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
