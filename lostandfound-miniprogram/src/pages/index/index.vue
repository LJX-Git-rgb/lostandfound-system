<template>
	<view>
		<uni-swiper-dot class="uni-swiper-dot-box" 
			@clickItem=clickItem 
			:info="swiperData"
			:current="current" 
			:mode="mode"
			:dots-styles="dotsStyles" field="content">

			<swiper class="swiper-box" @change="change" :current="swiperDotIndex" :autoplay="true" :circular="true">
				<swiper-item v-for="(item, index) in swiperData" :key="index">
					<image :src="item">
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
import QQMapWX from "@/utils/qqmap-wx-jssdk.min.js"
import Vue from 'vue'
	export default {
		data() {
			return {
				location:'地址',
				searchValue: '',

				//轮播图
                swiperData: [
                    "../../static/image/swiper/banner_1.jpg",
                    "../../static/image/swiper/banner_2.jpg",
                    "../../static/image/swiper/logo.png",
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
				avatar: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/460d46d0-4fcc-11eb-8ff1-d5dcf8779628.png',
			}
		},
		methods: {
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

			//卡片点击事件
			toLostList(){
				uni.navigateTo({url:'../goods/List?state=true'})
			},
			toFindList(){
				uni.navigateTo({url:'../goods/List?state=false'})
			},

			//微信登录--获取个人信息
			login(){
				wx.getUserProfile({
					desc: '用于完善会员资料', // 声明获取用户个人信息后的用途，会展示在弹窗中
					success: (resUser) => {

					    //获取用户资料成功后,进行登录,获取code和secret
                        wx.login({

                            success (res) {
                                //登录成功后传参进后端,进行对openId的查询
                                uni.request({
                                    url: new Vue({}).$baseUrl + 'user/getWechatOpenId?code='+res.code,
                                    method:'GET',
                                    success: (res) => {
										let openid = JSON.parse(res.data.data[0]).openid;
										if(openid != undefined){
											//如果能返回openid
											// 根据 openId 对数据库进行查询，如果没有的话放入数据库，有的话查询信息放入vuex
											uni.request({
												url: new Vue({}).$baseUrl + 'user/wechatLogin',
												method:'POST',
												data: {
													nickName: resUser.userInfo.nickName,
													gender: resUser.userInfo.gender == 0 ? "男" : "女",
													face: resUser.userInfo.avatarUrl,
													openId: openid,
												},
												success: (res) => {
                                                    console.log("登陆成功", res.data.data[0])
													wx.setStorageSync("userInfo",JSON.stringify(res.data.data[0]));
													new Vue({}).$store.dispatch('setUser',res.data.data[0]);
												}
											});
										}
										else{
											console.log("login failed")
										}
                                    }
                                })
                            }
                        })

                        this.$refs.popup.close();
						wx.showTabBar();
					},
					fail: res => {
						console.log("获取用户信息失败", res)
					}
				})
			},
		},
		mounted(){
			if(wx.getStorageSync("userInfo").length == 0){
				// 底部弹出框
				// 通过组件定义的ref调用uni-popup方法 ,如果传入参数 ，type 属性将失效 ，仅支持 ['top','left','bottom','right','center']
				this.$refs.popup.open('bottom')
				// 隐藏底部拦
				wx.hideTabBar();
			}else{
				this.$store.dispatch('setUser',JSON.parse(wx.getStorageSync("userInfo")))
			}
            //获取经纬度并逆地址解析
            uni.getLocation({
                type: 'wgs84',
                success: function (res) {
                    let qqmapsdk = new QQMapWX({
                        key: '5N6BZ-JICC3-OLO3L-3L3L2-4ILHF-6LBB4'
                    });
                    //根据经纬度进行地址定位
                    qqmapsdk.reverseGeocoder({
                        location: {
                            latitude: res.latitude,
                            longitude: res.longitude
                        },
                        success(res) {
                            console.log("地址定位成功",res.result.ad_info.city)
                            new Vue().$store.dispatch('setLocation', res.result.ad_info.city)
                        },
                    })
                }
            });
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