<template>
    <div id="mainsite-body">
      <div class="advert-top" v-if="message">
        <div class="ico-horn">
          <img src="../../assets/image/notice_logo.png" alt="">
        </div>
        <!-- 滚动文字区域 -->
        <div class="marquee-wrap">
          <ul class="marquee-box" id="marquee-box">
            <li class="marquee-list" v-for="i in 3" v-html="message" :id="i==1?'marquee':''" :key="i"></li>
          </ul>
        </div>
      </div>
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
                    <div v-for="item in foundGoods.slice(0,4)" :key="item.id">
                        <a @click="$router.push({path: 'goodsInfo', query:{state:'find', id:item.id}})">
                            <img :src= "require('../../../../lostandfound-miniprogram/src/static/image' + item.imageList[0])" :title="item.title" v-if="item.image != '' ">
                            <span>{{ item.title }}</span>
                        </a>
                    </div>
                </li>
                <li>
                    <div v-for="item in lostGoods.slice(0,4)" :key="item.id">
                        <a @click="$router.push({path: 'goodsInfo', query:{state:'lost', id:item.id}})">
                            <img :src= "require('../../../../lostandfound-miniprogram/src/static/image' + item.imageList[0])" :title="item.title">
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

<script type="text/javascript">
import goodsItem from '../../components/mainsite/goodsItem.vue'
import FindGoods from "@/views/mainsite/FindGoods";

export default {
    components: {FindGoods, goodsItem},
    data() {
        return {
            //分页获取数据
            begin:0,
            end:10,

            //数据集--存储前10个数据和算法匹配的数据
            foundGoods:[],
            lostGoods:[],
            personalCharacteristicGoods: [],

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
            columnCount:5,

          //公告
          message:""
        }
    },
    mounted() {
        // 调用axios请求最新的物品数据
        this.$axios({
            method: "get",
            url:"/api/finds/findLimit",
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
            url:"/api/losts/lostLimit",
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

        this.$axios({
            url:'/api/general/searchPersonCharcter',
            method:'GET',
            params:{
                id:this.$store.state.user.id
            }
        }).then(res=>{
            console.log(res)
            this.personalCharacteristicGoods = res.data[0];
        });

      this.$axios({
        method: "get",
        url:"/api/notice/search",
        params: {
          id: 1
        }
      }).then(res => {
        console.log(res)
        this.message = res.data.data[0].content
      })
      // 延时滚动
      setTimeout(() => {
        this.runMarquee();
      }, 1000);
    },
  methods: {
    runMarquee() {
      // 获取文字 计算后宽度
      var width = document.getElementById("marquee").getBoundingClientRect()
              .width,
          marquee = document.getElementById("marquee-box"),
          disx = 0; // 位移距离
      //设置位移
      setInterval(() => {
        disx--; // disx-=1; 滚动步长
        if (-disx >= width) {
          disx = 10; // 如果位移超过文字宽度，则回到起点  marquee-list的margin值
        }
        // marquee.style.transform = 'translateX(' + disx + 'px)'
        marquee.style.left = disx + "px";
      }, 30); //滚动速度
    }
  }
}
</script>

<style lang="less" scoped>

body,
div,
html,
img,
li,
ul {
  margin: 0;
  padding: 0;
  border: 0;
}
li {
  list-style: none;
}
.advert-top {
  position: relative;
  display: flex;
  //width: 300px;
  height: 30px;
  ////background-color: #fff;
  //color: #2d8cf0;
  //font-size: 14px;
  align-items: center;
}
.ico-horn {
  display: flex;
  margin-right: 10px;
  width: 14px;
  height: 14px;
  justify-content: center;
  align-items: center;
}
.ico-horn > img {
  width: 30px;
  height: 30px;
}
/* 以下代码与滚动相关 */
.marquee-wrap {
  position: relative;
  display: flex;
  overflow: hidden;
  width: 100%;
  height: 100%;
  margin-left: 20px;
}
.marquee-box {
  position: absolute;
  top: 50%;
  display: flex;
  white-space: nowrap;
  transform: translateY(-50%);
}
.marquee-list {
  margin-right: 10px;
}
.marquee-list span {
  padding: 0 0.04rem;
  color: #ffe17b;
  font-weight: 700;
}

#mainsite-body {
    padding: 0 6%;
    background: #74ebd5;
    background: -webkit-linear-gradient(to top, #ACB6E5, #74ebd5);
    background: linear-gradient(to top, #0a3442, #ACB6E5);
    overflow: auto;

    #menu-class {
        //margin: 20px 0px;
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
                            width: 200px;
                            display: inline-block;
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
