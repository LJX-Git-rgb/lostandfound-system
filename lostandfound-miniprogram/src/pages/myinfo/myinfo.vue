<template>
    <view>
        <view class="wechat-info" @click="toPersonInfo">
            <view class="face-img">
                <img :src="avatarUrl" alt="">
            </view>
            <view class="nick-name">
                <text>{{nickName}}</text>
            </view>
        </view>
        <view>
            <uni-card title="我发布的失物招领" :thumbnail="avatarUrl" @click="toFindList">
            </uni-card>
            <uni-card title="我发布的寻物启事"  :thumbnail="avatarUrl" @click="toLostList">
            </uni-card>
        </view>
    </view>
</template>
<script>
export default {
    data() {
        return {
            nickName: this.$store.state.user.nickName,
            avatarUrl: this.$store.state.user.face,
        }
    },
    methods:{
        toPersonInfo(){
            uni.navigateTo({url:'../myinfo/PersonInfo'})
        },
    
        //卡片点击事件
        toLostList(){
            uni.navigateTo({url:'../myinfo/MyUpload?state=false'})
        },
        toFindList(){
            uni.navigateTo({url:'../myinfo/MyUpload?state=true'})
        },
    },
    mounted() {
        console.log(this.$store.state)
    },
}
</script>

<style>
    .wechat-info{
        margin: 150rpx 50%;
        position: relative;
        left: -80rpx
    }
    .face-img{
        width: 150rpx;  
        height: 150rpx;  
        border-radius: 50%;  
        overflow:hidden;
    }
    .face-img image{
        width: 100%;
        height: 100%;
    }
    .nick-name{
        width: 200rpx;  
        height: 40rpx;  
        font-size: 35rpx;  
        line-height: 40rpx;
        margin-left: 20rpx;
        margin-top: 20rpx;
    }
</style>