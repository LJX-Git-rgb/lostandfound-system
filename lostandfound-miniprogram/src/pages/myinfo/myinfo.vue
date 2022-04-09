<template>
    <view>
        <view class="wechat-info">
            <view class="face-img">
                <img :src="avatarUrl" alt="">
            </view>
            <view class="nick-name">
                <text>{{nickName}}</text>
            </view>
        </view>
        <view>
            <uni-card title="我发布的失物招领" :thumbnail="avatar" @click="onClick">
            </uni-card>
            <uni-card title="我发布的寻物启事"  :thumbnail="avatar" @click="onClick">
            </uni-card>
        </view>
    </view>
</template>
<script>
export default {
    data() {
        return {
            nickName: this.$store.state.user.nickName,
            avatarUrl: this.$store.state.user.avatarUrl,
            avatar: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/460d46d0-4fcc-11eb-8ff1-d5dcf8779628.png',
        }
    },
    mounted() {
        console.log(this.$store.state.user)
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