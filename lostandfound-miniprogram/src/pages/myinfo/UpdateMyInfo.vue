<template>
    <div id="body">
        <uni-forms
            :modelValue="user"
            label-position="top">
            <uni-forms-item label="昵称：" >
                <uni-easyinput v-model="user.nickName"/>
            </uni-forms-item>
            <uni-forms-item label="注册邮箱：" >
                <uni-easyinput v-model="user.email"/>
            </uni-forms-item>
            <uni-forms-item>
                <button @click="uploadUserInfo">更新注册信息</button>
            </uni-forms-item>
        </uni-forms>

        <uni-forms
            :modelValue="userContactInfo"
            label-position="top">
            <uni-forms-item label="称呼：" >
                <uni-easyinput v-model="userContactInfo.appellation"/>
            </uni-forms-item>
            <uni-forms-item label="手机号：" >
                <uni-easyinput v-model="userContactInfo.phone"/>
            </uni-forms-item>
            <uni-forms-item label="qq：" >
                <uni-easyinput v-model="userContactInfo.qq"/>
            </uni-forms-item>
            <uni-forms-item label="微信：" >
                <uni-easyinput v-model="userContactInfo.wechat"/>
            </uni-forms-item>
            <uni-forms-item label="邮箱：" >
                <uni-easyinput v-model="userContactInfo.email"/>
            </uni-forms-item>
            <uni-forms-item label="地址：" >
                <uni-easyinput v-model="userContactInfo.address"/>
            </uni-forms-item>
            <uni-forms-item label="其他：" >
                <uni-easyinput v-model="userContactInfo.other"/>
            </uni-forms-item>
            <uni-forms-item>
                <button @click="updateUserContactInfo">更新联系方式</button>
            </uni-forms-item>
        </uni-forms>
    </div>
</template>

<script>
export default {
    data(){
        return{
            user:{
                id: this.$store.state.user.id,
                email:this.$store.state.user.email,
                nickName: this.$store.state.user.nickName,
            },
            faceImage:{},
            userContactInfo:{
                appellation:'',
                phone:'',
                qq:'',
                email:'',
                wechat:'',
                address:'',
                other:'',
            },
        }
    },
    mounted(){
        uni.request({
            url: this.$baseUrl + 'user/searchUserContact?uid='+this.$store.state.user.id,
            method: 'GET',
            success: (res)=>{
                this.userContactInfo = res.data.data[0]
            },
        })
    },
    methods:{
        uploadUserInfo(){
            uni.request({
                url: this.$baseUrl + "user/updateUser",
                method: 'POST',
                data: {
                    id: this.user.id,
                    nickName:this.user.nickName,
                    email:this.user.email,
                },
                success: (res) => {
                    this.$store.dispatch('setUser',res.data.data[0]);
                    wx.setStorageSync("userInfo",JSON.stringify(res.data.data[0]));
                    uni.showToast({
                        title:'更改成功'
                    })
                    setTimeout(() => {
                        uni.navigateTo({url:'/pages/myinfo/PersonInfo'})
                    },1000)
                }
            });
        },
        updateUserContactInfo(){
            uni.request({
                url: this.$baseUrl + 'user/updateUserContact',
                method: 'POST',
                data:{
                    id:this.userContactInfo.id,
                    appellation:this.userContactInfo.appellation,
                    phone:this.userContactInfo.phone,
                    qq:this.userContactInfo.qq,
                    email:this.userContactInfo.email,
                    wechat:this.userContactInfo.wechat,
                    address:this.userContactInfo.address,
                    other:this.userContactInfo.other,
                },
                success: res =>{
                    uni.showToast({
                        title:'更改成功'
                    })
                    setTimeout(() => {
                        uni.navigateTo({url:'/pages/myinfo/PersonInfo'})
                    },1000)
                }
            })
        },
    }
}
</script>

<style lang="scss">
</style>