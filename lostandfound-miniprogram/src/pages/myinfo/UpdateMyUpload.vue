<template>
    <div id="body">
        <uni-forms
            :modelValue="goodsInfo"
            label-position="top">
            <uni-forms-item label="标题：" >
                <uni-easyinput v-model="goodsInfo.title" placeholder="请起个标题吧"/>
            </uni-forms-item>
            <uni-forms-item :label="current === 0 ? '拾物描述：' : '失物描述：'" >
                <uni-easyinput v-model="goodsInfo.description" placeholder="请输入描述,越详细越好" type="textarea"/>
            </uni-forms-item>
            <uni-forms-item label="物品类别：" >
                <uni-data-checkbox v-model="goodsInfo.type" multiple :localdata="type" />
            </uni-forms-item>
            <uni-forms-item :label="current === 0 ? '捡到区域：' : '丢失区域：'" >
                <uni-easyinput v-model="goodsInfo.area" placeholder="市区内的地址"/>
            </uni-forms-item>
            <uni-forms-item :label="current === 0 ? '捡到时间：' : '丢失时间：'">
                <uni-datetime-picker type="datetime" return-type="timestamp" v-model="goodsInfo.time"/>
            </uni-forms-item>
            <uni-forms-item>
                <button @click="updateInfo">更新</button>
            </uni-forms-item>
        </uni-forms>
    </div>
</template>

<script>
export default {
    data(){
        return{
            goodsInfo:{},
            state:"",
            type: [
                {"value": "现金","text": "现金"	},
                {"value": "卡","text": "卡"},
                {"value": "电子产品","text": "电子产品"},
                {"value": "食品","text": "食品"},
                {"value": "生活用品","text": "生活用品"}
            ],
        }
    },
    methods:{
      updateInfo(){
          console.log(this.goodsInfo)
          var url="";
          let tag = "";
          if(this.goodsInfo.type != undefined){
              for (let i = 0; i < this.goodsInfo.type.length; i++) {
                  tag += this.goodsInfo.type[i] + '&';
              }
          }
          if(this.state == 'true'){
              url="finds/update"
          }else{
              url="losts/update"
          }
          console.log(tag,this.goodsInfo)
          uni.request({
              url: this.$baseUrl + url,
              method: 'POST',
              data: {
                  id:this.goodsInfo.id,
                  title: this.goodsInfo.title,
                  description: this.goodsInfo.description,
                  foundArea: this.goodsInfo.area + '&' + this.$store.state.user.location,
                  foundTime: this.goodsInfo.time,
                  tag: tag,
              },
              success: (res) => {
                  if(this.state == 'true'){
                      uni.navigateTo({url:'../goods/List?state=true'})
                  }else{
                      uni.navigateTo({url:'../goods/List?state=false'})
                  }
              }
          });
      }
    },
   onLoad(option){
        this.state = option.state;
        this.goodsInfo = JSON.parse(decodeURIComponent(option.goods));
   }
}
</script>

<style lang="scss">
#body{
}
</style>