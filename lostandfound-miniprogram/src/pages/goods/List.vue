<template>
    <view id="content">
        <uni-search-bar
            v-model="searchValue"
            placeholder="搜索"
            bgColor="#EEEEEE"
            class="search-bar"
            @confirm="search"
            @blur="blur"
            @clear="clear">
        </uni-search-bar>
        <uni-card :title="item.title" :sub-title="'发布时间' + new Date(item.createTime).format('yyyy-MM-dd hh:mm:ss').toString()" class="card" v-for="item in goodsList"
                  :key="item.id">
            <!-- 轮播图 -->
            <view @click="toGoodsInfo(item.id)">
                <swiper class="swiper" :indicator-dots="true" :autoplay="true" :interval="2000" :duration="500">
                    <swiper-item v-for="(url, index) in item.imageList" :key="index">
                        <image :src="'../../static/image'  + url " alt="" mode='aspectFit'>
                    </swiper-item>
                </swiper>
                <!-- desc -->
                <text class="uni-body uni-mt-5">
                    {{ item.description }}
                </text>
            </view>
            <!-- 选项 -->
            <view slot="actions" class="card-actions">
                <button open-type="share" @click="shareId=item.id"></button>
                <view class="card-actions-item" @click="actionsClick('分享')">
                    <uni-icons type="staff" size="18" color="#999"></uni-icons>
                    <text class="card-actions-item-text">分享</text>
                </view>
                <view class="card-actions-item" @click="actionsClick('点赞')">
                    <uni-icons type="heart" size="18" color="#999"></uni-icons>
                    <text class="card-actions-item-text">点赞</text>
                </view>
                <view class="card-actions-item" @click="actionsClick('评论')">
                    <uni-icons type="chatbubble" size="18" color="#999"></uni-icons>
                    <text class="card-actions-item-text">评论</text>
                </view>
            </view>
        </uni-card>
        <uni-load-more :status="status"></uni-load-more>
    </view>
</template>

<script>
import {shareMixins} from '@/utils/share'
Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1,                 //月份
        "d+": this.getDate(),                    //日
        "h+": this.getHours(),                   //小时
        "m+": this.getMinutes(),                 //分
        "s+": this.getSeconds(),                 //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds()             //毫秒
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}

export default {
    mixins: [shareMixins],
    data() {
        return {
            //goods 集合
            goodsList: [],
            bacGoods:[],

            //查询限制
            begin: 0,
            end: 5,
            total:0,

            //表示是find or list
            flag: true,

            //分享的参数
            shareId: '',
            shareData: {
                title: '这是一个分享',
                path: '/pages/goods/List'           // 分享的页面路径
            },

            //无限加载
            status:'more',

            //搜索框内容
            searchValue:'',
        }
    },
    methods: {
        actionsClick(text) {
            uni.showToast({
                title: text,
                icon: 'none'
            })
        },

        toGoodsInfo(id){
            uni.navigateTo({url:'../goods/Info?state=' + this.flag + '&id='+id})
        },
        // 搜索事件
        //查询
        search() {
            if (this.bacGoods.length == 0) {
                this.bacGoods = this.goodsList;
            }
            this.goodsList = this.goodsList.filter(item => {
                if (this.flag == "true") {
                    return item.title.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1 || item.description.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1
                        || item.tag.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1 || item.foundArea.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1;
                }else {
                    return item.title.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1 || item.description.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1
                        || item.tag.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1 || item.lostArea.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1;
                }
            })
            this.status = 'no-more';
        },
        //清空
        clear() {
            this.goodsList = this.bacGoods;
            this.status = 'more';
        },
        //离开
        blur() {
            if (this.searchValue == undefined || this.searchValue.length == 0){
                this.clear()
            }
        },

        //
        load() {
            var url;
            if (this.flag == "true") {
                url = this.$baseUrl + "finds/findLimit?begin=" + this.begin + "&end=" + this.end
            } else {
                url = this.$baseUrl + "losts/lostLimit?begin=" + this.begin + "&end=" + this.end
            }
            uni.request({
                url: url,
                method: 'GET',
                success: (res) => {
                    if (res.statusCode == 200) {
                        this.goodsList = this.goodsList.concat(res.data);
                        this.bacGoods = this.goodsList;
                    }
                },
            })
        },
        countGoods(){
            uni.request({
                url:this.$baseUrl + 'generalgoods/countGoods?flag=' + this.flag,
                method:"GET",
                success:(res)=>{
                    this.total = res.data;
                }
            })
        }
    },
    onLoad(option) { //option为object类型，会序列化上个页面传递的参数
        this.flag = option.state
    },
    onPullDownRefresh() {
        this.end = 10;
        this.begin = 0;
        this.load()
    },
    onReachBottom(){
        if (this.status == 'no-more'){
            return;
        }
        if (this.begin + this.end < this.total) {
            this.status = "loading"
            setTimeout(() => {
                this.begin += 5;
                this.load();
                this.status = "more"
            }, 1500);
        }else {
            this.status = 'no-more'
        }
    },
    mounted() {
        this.countGoods();
        this.load();
        if (this.flag == "false") {
            wx.setNavigationBarTitle({
                title: "寻物启事"
            })
        }
    },
}
</script>

<style lang="scss" scoped>
.card {
    swiper {
        image {
            width: 100%;
            height: 100%;
        }
    }

    text {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical
    }

    .card-actions {
        display: flex;
        border-top: 1px solid #EBEEF5;
        padding: 20rpx;

        button {
            position: relative;
            left: 120rpx;
            opacity: 0;
        }

        .card-actions-item {
            flex: 1;
            text-align: center;

            text {
                margin-left: 8rpx;
                color: rgb(106, 106, 106);
            }
        }
    }
}
</style>