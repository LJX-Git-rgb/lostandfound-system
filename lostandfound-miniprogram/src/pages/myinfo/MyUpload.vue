<template>
    
</template>

<script>
export default {
    data() {
        return {
            flag:"",
            goodsList:[],
        }
    },
    methods:{
        load(){
            if(this.flag == "true"){
                var url=this.$baseUrl+"finds/byUser?uid="+this.$store.state.user.id
                uni.request({
                    url: url,
                    method: 'GET',
                    success: (res)=>{
                        if(res.statusCode == 200){
                            this.goodsList = res.data;
                        }
                    },
                })
            }else{
                var url=this.$baseUrl+"losts/byUser?uid="+this.$store.state.user.id
                uni.request({
                    url: url,
                    method: 'GET',
                    success: (res)=>{
                        if(res.statusCode == 200){
                            this.goodsList = res.data;
                        }
                    },
                })
            }
        },
    },
    onLoad(option) { //option为object类型，会序列化上个页面传递的参数
		this.flag = option.state
	},
    onPullDownRefresh() {
        this.load()
    },
    mounted(){
        this.load();
        if(this.flag == "false"){
            wx.setNavigationBarTitle({
                title: "我的发布-寻物启事"
            })
        }
    }
}
</script>

<style>

</style>