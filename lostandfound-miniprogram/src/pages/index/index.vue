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

			<swiper class="swiper-box" @change="change" :current="swiperDotIndex">
				<swiper-item v-for="(item, index) in info" :key="index">
					<image :src="item.url" alt="">
				</swiper-item>
			</swiper>
		</uni-swiper-dot>
		<uni-card :cover="cover" @click="onClick">
				<!-- <image slot='cover' style="width: 100%;" :src="cover"></image> -->
				<text class="uni-body">这是一个带封面和操作栏的卡片示例，此示例展示了封面插槽和操作栏插槽的用法。</text>
				<view slot="actions" class="card-actions">
					<view class="card-actions-item" @click="actionsClick('分享')">
						<uni-icons type="pengyouquan" size="18" color="#999"></uni-icons>
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
	</view>
</template>

<script>
	export default {
		data() {
			return {
				location:'地址',
				searchValue: '',

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
				swiperDotIndex: 0
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
			}
		},
		onBackPress() {
			// #ifdef APP-PLUS
			plus.key.hideSoftKeybord();
			// #endif
		}
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
</style>