<template>
  <view id="content">
        <uni-card :title="item.title" :sub-title="'发布时间' + item.createTime" class="card" 
            v-for="item in lostGoodsList" :key="item.id">
            
            <!-- 轮播图 -->
            <swiper class="swiper" :indicator-dots="true" :autoplay="true" :interval="2000" :duration="500" :circular="true">
              <swiper-item v-for="(url, index) in item.imageList" :key="index">
					<image :src="'../../../../image'  + url " alt="">
				</swiper-item>
            </swiper>
            <!-- desc -->
            <text class="uni-body uni-mt-5"> {{item.description}}</text>
            
            <!-- 选项 -->
            <view slot="actions" class="card-actions">
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
export default {
    data() {
        return {
            info: [{
						colorClass: 'uni-bg-red',
						url: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/094a9dc0-50c0-11eb-b680-7980c8a877b8.jpg',
						content: '内容 A'
					},
					{
						colorClass: 'uni-bg-green',
						url: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/094a9dc0-50c0-11eb-b680-7980c8a877b8.jpg',
						content: '内容 B'
					},
					{
						colorClass: 'uni-bg-blue',
						url: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/094a9dc0-50c0-11eb-b680-7980c8a877b8.jpg',
						content: '内容 C'
					}
			],
            
            lostGoodsList:[],
            begin:0,
            end:5,

            status:'more'
        }
    },
    methods: {
        onClick(item){
            uni.navigateTo({
                url: './lostInfo?item=' + item
            });
        },
        actionsClick(text){
            uni.showToast({
                title:text,
                icon:'none'
            })
        },
    },
    //下拉刷新页面
    onPullDownRefresh() {
        console.log("haha")
        setTimeout(() => {
            uni.stopPullDownRefresh();
            console.log("pause")
        }, 500);
    },
    onReachBottom(){
        this.status = "loading"
        setTimeout(() => {
            this.list += 4;
        }, 5000);
        this.status = "more"
    },
    mounted() {
        var url=this.$baseUrl+"losts/lostLimit?begin=" + this.begin + "&end="+this.end
        uni.request({
            url: url,
            method: 'GET',
            success: (res)=>{
                if(res.statusCode == 200){
                    this.lostGoodsList = res.data;
                }
            },
            fail: (err)=>{

            }
        })

    },
}
</script>

<style lang="scss" scoped>
.card{
    swiper{
        image{
            width: 100%;
            height: 100%;
        }
    }
    text{
         overflow : hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical
    }
    .card-actions{
        display: flex;
        border-top: 1px solid #EBEEF5;
        padding: 20rpx;        
        .card-actions-item{
            flex: 1;
            text-align: center;

            text{
                margin-left: 8rpx;
                color: rgb(106, 106, 106);
            }
        }
    }
}
</style>