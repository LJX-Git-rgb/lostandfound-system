<template>
	<div id="mainsite-body">
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
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
				</li>
				<li>
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
				</li>
				<li>
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
				</li>
				<li>
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
					<div><a href="">hahajack</a></div>
				</li>
			</ul>
		</div>
		<div class="infinite-list-wrapper" style="overflow:auto">
			<ul
			  class="list"
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
			count: 10,
			loading: false,
			// 轮播图
			imgFolder: '',
			imgList:[
				{
					url: '/image/haha.jpeg',
					alt: 'haha'
				},
				{
					url: '/image/login_backImg.jpeg',
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
			setTimeout(() => {
				this.count += 2
				this.loading = false
			}, 2000)
		},
		haha(){}
	},
}
</script>
<style lang="less" scoped>
	#mainsite-body{
		padding: 0 6%;
		
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
				flex: 0.5;
				margin-top: 20px;
				margin-left: 30px;

				li{
					height: 30px;
					width: 100%;
					line-height: 30px;
					border: 1px solid;
					margin: 23px;
					display: flex;
					div{
						flex: 1;
					}
				}
			}
		}
	.infinite-list-wrapper{
		margin-top: 3%;
	}
}
</style>
