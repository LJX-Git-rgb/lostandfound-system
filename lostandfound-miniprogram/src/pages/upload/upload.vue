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
			<view v-if="current === 0">
				<uni-forms ref="baseForm" :modelValue="uploadForm">
					<uni-forms-item label="标题" required>
						<uni-easyinput v-model="uploadForm.name" placeholder="请起个标题吧"/>
					</uni-forms-item>
					<uni-forms-item label="描述" required>
						<uni-easyinput v-model="uploadForm.age" placeholder="请输入描述,我们将根据他匹配结果" />
					</uni-forms-item>
					<uni-forms-item label="丢失类别" required>
						<uni-data-checkbox v-model="uploadForm.hobby" multiple :localdata="hobbys" />
					</uni-forms-item>
					<uni-forms-item label="日期时间">
						<uni-datetime-picker type="datetime" return-type="timestamp" v-model="uploadForm.datetimesingle"/>
					</uni-forms-item>
					<uni-forms-item>
						<uni-file-picker limit="9" title="最多选择9张图片"></uni-file-picker>
					</uni-forms-item>
					<uni-forms-item>
						<button @click="submit">Submit</button>
					</uni-forms-item>

				</uni-forms>
			</view>

			<view v-if="current === 1">
				<uni-forms ref="baseForm" :modelValue="uploadForm">
					<uni-forms-item label="标题" required>
						<uni-easyinput v-model="uploadForm.name" placeholder="请起个标题吧" />
					</uni-forms-item>
					<uni-forms-item label="描述" required>
						<uni-easyinput v-model="uploadForm.age" placeholder="请输入描述,我们将根据他匹配结果" />
					</uni-forms-item>
					<uni-forms-item label="丢失类别" required>
						<uni-data-checkbox v-model="uploadForm.hobby" multiple :localdata="hobbys" />
					</uni-forms-item>
					<uni-forms-item label="日期时间">
						<uni-datetime-picker type="datetime" return-type="timestamp" v-model="uploadForm.datetimesingle"/>
					</uni-forms-item>
					<uni-forms-item>
						<uni-file-picker limit="9" title="最多选择9张图片"></uni-file-picker>
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
				uploadForm: {},
				hobbys:["卡","包","生活用品","现金"],
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
