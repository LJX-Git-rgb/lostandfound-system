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
                <view class="card-actions-item" @click="deleteInfo(item.id)">
                    <uni-icons type="chatbubble" size="18" color="#999"></uni-icons>
                    <text class="card-actions-item-text">删除</text>
                </view>
            </view>
        </uni-card>
    </view>
</template>
<script>
export default {
    data() {
        return {
            flag: "",
            goodsList: [],
            listBac:[],
            searchValue:"",
        }
    },
    methods: {
        search(){
            this.goodsList = this.goodsList.filter(item => {
                if (this.flag == "true") {
                    return item.title.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1 || item.description.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1
                        || item.tag.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1 || item.foundArea.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1;
                }else {
                    return item.title.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1 || item.description.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1
                        || item.tag.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1 || item.lostArea.toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1;
                }
            })
        },
        clear(){
            this.goodsList = this.listBac;
        },
        blur(){
            if (this.searchValue == undefined || this.searchValue.length == 0){
                this.goodsList = this.listBac;
            }
            console.log("haha")
        },
        load() {
            if (this.flag == "true") {
                var url = this.$baseUrl + "finds/byUser?uid=" + this.$store.state.user.id
                uni.request({
                    url: url,
                    method: 'GET',
                    success: (res) => {
                        if (res.statusCode == 200) {
                            this.goodsList = res.data;
                            this.listBac = res.data;
                        }
                    },
                })
            } else {
                var url = this.$baseUrl + "losts/byUser?uid=" + this.$store.state.user.id
                uni.request({
                    url: url,
                    method: 'GET',
                    success: (res) => {
                        if (res.statusCode == 200) {
                            this.goodsList = res.data;
                        }
                    },
                })
            }
        },
        toGoodsInfo(id) {
            uni.navigateTo({url:'../goods/Info?state=' + this.flag + '&id='+id})
        },
        deleteInfo(id){
          uni.request({
              url: this.$baseUrl + 'generalgoods/deletebyid',
              method:'get',
              data:{
                  id:id,
                  flag: this.flag != "true",
              },
              success: (res) => {
                  uni.showToast({
                      title:"删除成功",
                  })
                  this.load();
              },
          })
        },
    },
    onLoad(option) { //option为object类型，会序列化上个页面传递的参数
        this.flag = option.state
    },
    onPullDownRefresh() {
        this.load()
    },
    mounted() {
        this.load();
        if (this.flag == "false") {
            wx.setNavigationBarTitle({
                title: "我的发布-寻物启事"
            })
        }
    }
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
            left: 170rpx;
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