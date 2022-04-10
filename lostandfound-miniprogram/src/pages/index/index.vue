// 1. 商品信息页
// 3. 首页布局
<template>
	<view>
		<ui-row class="bar">
			<view class="local-bar">
				<uni-icons type="location-filled" size="20"></uni-icons>
				<text slot="">{{location}}</text>
			</view>
			<uni-search-bar 
				v-model="searchValue" 
				placeholder="搜索" 
				bgColor="#EEEEEE"
				class="search-bar"
				@confirm="search" 
				@blur="blur" 
				@focus="focus" 
				@input="input"
				@cancel="cancel" 
				@clear="clear">
			</uni-search-bar>
		</ui-row>
		<uni-swiper-dot class="uni-swiper-dot-box" 
			@clickItem=clickItem 
			:info="info" 
			:current="current" 
			:mode="mode"
			:dots-styles="dotsStyles" field="content">

			<swiper class="swiper-box" @change="change" :current="swiperDotIndex" :autoplay="true" :circular="true">
				<swiper-item v-for="(item, index) in info" :key="index">
					<image :src="item.url" alt="">
				</swiper-item>
			</swiper>
		</uni-swiper-dot>
		<uni-card title="失物招领" sub-title="我丢了东西" extra="查看更多" :thumbnail="avatar" @click="toLostList">
		</uni-card>
		<uni-card title="寻物启事" sub-title="我捡到了东西" extra="查看更多" :thumbnail="avatar" @click="toFindList">
		</uni-card>

		<uni-popup ref="popup" type="dialog" :animation="false" :mask-click = "false" background-color="#ccc" >
			<view class="dialog">
				<view class='content'>
					<view class="face-img"></view>
					<span>失物招领网</span>
					<view>申请获取以下权限</view>
					<text>获得你的公开信息(昵称，头像等)</text>
					<button type="primary" @click="login">授权登录</button>
				</view>
			</view>
		</uni-popup>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				location:'地址',
				searchValue: '',

				//轮播图
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
				dotStyle: [{
						backgroundColor: 'rgba(0, 0, 0, .3)',
						border: '1px rgba(0, 0, 0, .3) solid',
						color: '#fff',
						selectedBackgroundColor: 'rgba(0, 0, 0, .9)',
						selectedBorder: '1px rgba(0, 0, 0, .9) solid'
					},
					{
						backgroundColor: 'rgba(255, 90, 95,0.3)',
						border: '1px rgba(255, 90, 95,0.3) solid',
						color: '#fff',
						selectedBackgroundColor: 'rgba(255, 90, 95,0.9)',
						selectedBorder: '1px rgba(255, 90, 95,0.9) solid'
					},
					{
						backgroundColor: 'rgba(83, 200, 249,0.3)',
						border: '1px rgba(83, 200, 249,0.3) solid',
						color: '#fff',
						selectedBackgroundColor: 'rgba(83, 200, 249,0.9)',
						selectedBorder: '1px rgba(83, 200, 249,0.9) solid'
					}
				],
				modeIndex: -1,
				styleIndex: -1,
				current: 0,
				mode: 'default',
				dotsStyles: {},
				swiperDotIndex: 0,	

				//卡片
				cover: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/094a9dc0-50c0-11eb-b680-7980c8a877b8.jpg',
				avatar: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/460d46d0-4fcc-11eb-8ff1-d5dcf8779628.png',
				extraIcon:{
					color: '#4cd964',
					size: '22',
					type: 'gear-filled'
				}
			}
		},
		methods: {
			// 搜索事件
			//查询
			search(res) {
				console.log('search:', res)
			},
			//输入
			input(res) {
				console.log('input:', res)
			},
			//清空
			clear(res) {
				console.log("clear",res)
			},
			//离开
			blur(res) {
				console.log("blur",res)
			},
			//聚焦
			focus(e) {
				console.log("focus",e)
			},
			//取消搜索
			cancel(res) {
				console.log("cancel",res)
			},

			// 轮播事件
			change(e) {
				this.current = e.detail.current
			},
			selectStyle(index) {
				this.dotsStyles = this.dotStyle[index]
				this.styleIndex = index
			},
			selectMode(mode, index) {
				this.mode = mode
				this.modeIndex = index
				this.styleIndex = -1
				this.dotsStyles = this.dotStyle[0]
			},
			clickItem(e) {
				this.swiperDotIndex = e
			},
			onBanner(index) {
				console.log(22222, index);
			},

			//卡片事件
			toLostList(){
				uni.navigateTo({url:'../lost/lostList'})
			},
			toFindList(){
				console.log("find")
				uni.navigateTo({url:'../find/findList'})
			},

			//登录
			login(){
				wx.getUserProfile({
					desc: '用于完善会员资料', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
					success: (res) => {
						console.log("获取用户信息成功", res)
						this.$store.dispatch('setUser',res.userInfo);
						this.$refs.popup.close();
						wx.showTabBar();
					},
					fail: res => {
						console.log("获取用户信息失败", res)
					}
				})
			}
		},
		// mounted(){
        // 	// 通过组件定义的ref调用uni-popup方法 ,如果传入参数 ，type 属性将失效 ，仅支持 ['top','left','bottom','right','center']
		// 	this.$refs.popup.open('bottom')
		// 	wx.hideTabBar();
		// 	uni.getLocation({
		// 		type: 'wgs84',
		// 		success: function (res) {
		// 			console.log(res);
		// 		}
		// 	});
		// }
	}
</script>

<style scoped>
    /* @import '../../..//miniprogram_npm/weui-miniprogram/weui-wxss/dist/style/weui.wxss'; */
	
	/* 顶部地址和搜索 */
	.bar{
		display: flex;
	}
	.local-bar{
		display: flex;
		line-height: 106rpx;
	}
	.search-bar{
		flex: 1;
	}

	/* 轮播图 */
	.swiper-box {
		height: 400rpx;
	}
	swiper-item image{
		width: 100%;
		height: 100%;
	}

	/* 弹出框 */
	.dialog{
		width: 100%;
		height: 500rpx;
		background-color: #ccc;
		border: 1px solid #ccc;
		padding-bottom: 50rpx;
	}
	.dialog .face-img{
        width: 150rpx;  
        height: 150rpx;  
        border-radius: 50%;  
        overflow:hidden;
		margin-left: 50%;
		margin-bottom: -30rpx !important;
		margin-top: 90rpx !important;
		position: relative;
		left: -75rpx;

		background-image: url("../../static/img/logo.jpg");
		background-size: contain;

	}
	.dialog span{
		margin-bottom: 40rpx;
		font-size: 38rpx;
		display: inline-block;
		margin-left: 50%;
		position: relative;
		left: -105rpx;
	}
	.dialog .content{
		padding: 0 100rpx;
	}
	.dialog .content view{
		font-size: 34rpx;
		font-weight: bold;
		margin-bottom: 10rpx;
	}
	.dialog .content text{
		font-size: 24rpx;
		margin-left: 30rpx;
		margin-bottom: 20rpx;
		display: inline-block;
	}
	.dialog .content button{
		border-radius: 24rpx;
		height: 80rpx;
		font-size: 28rpx;
		line-height: 80rpx;
	}
</style>