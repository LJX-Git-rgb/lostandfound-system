<template>
	<div id="mainsite-body">
		<div id="menu-class">
			
		</div>
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
					<div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
					<div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
					<div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
					<div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
				</li>
				<li>
					<div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
					<div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
					<div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
					<div><a href=""><img src="../../assets/image/haha.jpeg" alt=""><span>haha</span></a></div>
				</li>
			</ul>
		</div>
		<div class="infinite-list-wrapper" style="overflow:auto">
			<ul
			  class="goodslist"
			  v-infinite-scroll="load"
			  infinite-scroll-disabled="disabled"
			  >
				<li v-for="i in count" class="list-item" :key="i">
					<goods-item/>
				</li>
			</ul>
			<p v-if="loading">加载中...</p>
			<p v-if="noMore">没有更多了</p>
		</div>
	</div>
</template>

<script>
import goodsItem from '../../components/goodsItem.vue'
export default {
	components: { goodsItem },
	data () {
		return {
			// 无限滚动展示
			count: 3,
			loading: false,
			// 轮播图
			imgFolder: '',
			imgList:[
				{
					url: require('../../assets/image/haha.jpeg'),
					alt: 'haha'
				},
				{
					url: require('../../assets/image/login_backImg.jpeg'),
					alt: 'heihei'
				},
			]
		}
	},
	computed: {
		noMore () {
			return this.count >= 20
		},
		disabled () {
			return this.loading || this.noMore
		}
	},
	methods: {
		load () {
			this.loading = true
			// setTimeout(() => {
			// 	this.count += 2
			// 	this.loading = false
			// }, 2000)
		},
		haha(){}
	},
}
</script>

<style lang="less" scoped>
	#mainsite-body{
		padding: 0 6%;
		background: #74ebd5; 
		background: -webkit-linear-gradient(to top, #ACB6E5, #74ebd5);  
		background: linear-gradient(to top, #0a3442,#ACB6E5);
		#menu-class{
			width: 100%;
			height: 110px;
		}
		#carousel-and-filter{
			height: 300px;
			display: flex;
			
			#carousel-wrap{
				flex: 0.7;
			
				.el-carousel__item h3 {
					color: #475669;
					font-size: 18px;
					opacity: 0.75;
					line-height: 100%;
				}
				.el-carousel__item {
					img{
						width: 100%;
						height: 100%;
					}
				}
			}
			#filter-menu{
				margin-left: 30px;
				flex: 1;
				li{
					height: 50%;
					width: 100%;
					text-align: center;
					display: flex;
					div{
						flex: 1;
						margin-right: 3%;
						margin-top: 1.5%;
						img{
							width: 100%;
							height: 80%;
						}
					}
				}
			}
		}
	.infinite-list-wrapper{
		margin-top: 3%;
		li{
			margin-bottom: 2%;
		}
		p{
			text-align: center;
			font-size: 18px;
			font-weight: 600;
			color: #475669;
			margin-bottom: 5%;
			border-bottom: 2px solid #475669;
			opacity: 0.7;
		}
	}
}
</style>
