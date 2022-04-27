<template>
	<view class="body">
		<view class="uni-padding-wrap uni-common-mt">
			<uni-segmented-control 
				:current="current" 
				:values="items" 
				style-type="text"
				@clickItem="onClickItem" />
		</view>
		<view class="upload-form">
			<view>
				<uni-forms 
				:modelValue="uploadForm"
				label-position="top">
					<uni-forms-item label="标题：" >
						<uni-easyinput v-model="uploadForm.title" placeholder="请起个标题吧"/>
					</uni-forms-item>
					<uni-forms-item :label="current === 0 ? '拾物描述：' : '失物描述：'" >
						<uni-easyinput v-model="uploadForm.description" placeholder="请输入描述,越详细越好" type="textarea"/>
					</uni-forms-item>
					<uni-forms-item label="物品类别：" >
						<uni-data-checkbox v-model="uploadForm.type" multiple :localdata="type" />
					</uni-forms-item>
					<uni-forms-item :label="current === 0 ? '捡到区域：' : '丢失区域：'" >
						<uni-easyinput v-model="uploadForm.area" placeholder="市区内的地址"/>
					</uni-forms-item>
					<uni-forms-item :label="current === 0 ? '捡到时间：' : '丢失时间：'">
						<uni-datetime-picker type="datetime" return-type="timestamp" v-model="uploadForm.time"/>
					</uni-forms-item>
					<uni-forms-item label="上传图片：">
						<!-- 限制9张 ， 绑定值，限定只能图片，grid类型展示，取消自动上传，绑定的方法 -->
						<uni-file-picker 
						limit="9" 
						title="最多选择9张图片"
						v-model="imageList"
						fileMediatype="image" 
						mode="grid" 
						:auto-upload="false"
						@select="select" 
						@progress="progress" 
						@success="success" 
						@fail="fail" 
						>
						</uni-file-picker>
					</uni-forms-item>
					<uni-forms-item>
						<button @click="upload">Submit</button>
					</uni-forms-item>
				</uni-forms>
			</view>

		</view>
	</view>
</template>

<script>
export default {
		data() {
			return {
				uploadForm: {
					images:[],
				},
				imageList:[],
				type: [
					{"value": "现金","text": "现金"	},
					{"value": "卡","text": "卡"},
					{"value": "电子产品","text": "电子产品"},
					{"value": "食品","text": "食品"},
					{"value": "生活用品","text": "生活用品"}
				],
				items: ["失物招领","寻物启事"],
				current: 0,
			}
		},
		methods: {
			onClickItem(e) {
				if (this.current !== e.currentIndex) {
					this.current = e.currentIndex
				}
			},
			upload(){
				//上传图片
				if(this.imageList.length > 0){
					var url=""
					if(this.current == 0){
						url="finds/addImg"
					}else{
						url="losts/addImg"
					}

					for(let i = 0; i < this.imageList.length; i++){
						uni.uploadFile({
							url: this.$baseUrl + url,
							filePath:this.imageList[i].url,
							name:"file",
							formData: {},
							success: (res) => {
								this.uploadForm.images.push(JSON.parse(res.data).data[0])
							}
						});
					}
					this.uploadOther();
				}else{
					this.uploadOther();
				}
				
			},
			uploadOther(){
				//上传其他数据
				var url="";
				let tag = "", image = "";
				if(this.uploadForm.type != undefined){
					for (let i = 0; i < this.uploadForm.type.length; i++) {
						tag += this.uploadForm.type[i] + '&';
					}
				}
				if(this.uploadForm.images.length >= 0){
					console.log(this.uploadForm.images);
					for (let i = 0; i < this.uploadForm.images.length+1; i++) {
						console.log(i,this.uploadForm.images[i]);
						image += this.uploadForm.images[i] + '&';
					}
				}
				if(this.current == 0){
					url="finds/add"
				}else{
					url="losts/add"
				}
				uni.request({
					url: this.$baseUrl + url,
					method: 'POST',
					data: {
						uid: this.$store.state.user.id,
						title: this.uploadForm.title,
						description: this.uploadForm.description,
						foundArea: this.uploadForm.area + '&' + this.$store.state.user.location,
						foundTime: this.uploadForm.time,
						tag: tag,
						image: image
					},
					success: (res) => {
						console.log(res.data);
					}
				});
			},

			//上传组件的方法
			// 获取上传状态
			select(e){
				console.log('选择文件：',e.tempFiles[0])
				this.imageList.push(e.tempFiles[0])
			},
			// 获取上传进度
			progress(e){
				console.log('上传进度：',e)
			},
			
			// 上传成功
			success(e){
				console.log('上传成功')
			},
			
			// 上传失败
			fail(e){
				console.log('上传失败：',e)
			}
		}
}
</script>

<style lang="scss" scoped>
	.body{
		.uni-common-mt {
			margin: 10rpx;
			padding: 0px 50rpx;
		}
		.upload-form{
			padding: 70rpx;
		}
	}
	
</style>
