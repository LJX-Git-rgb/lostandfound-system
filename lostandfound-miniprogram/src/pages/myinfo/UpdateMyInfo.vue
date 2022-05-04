<template>
    <div id="body">
        <uni-forms
            :modelValue="user"
            label-position="top">
            <uni-forms-item label="昵称：" >
                <uni-easyinput v-model="newUser.nickName" />
            </uni-forms-item>
            <uni-forms-item label="注册邮箱：" >
                <uni-easyinput v-model="newUser.email"/>
            </uni-forms-item>
            <uni-forms-item label="头像：">
                <img :src=" '../../static/image/face/' + newUser.face" alt="" v-if="newUser.face != null">
                <uni-file-picker
                    limit="1"
                    v-model="faceImage"
                    fileMediatype="image"
                    :auto-upload="false"
                    @select="select"
                >
                </uni-file-picker>
            </uni-forms-item>
            <uni-forms-item>
                <button @click="updateUser">更新注册信息</button>
            </uni-forms-item>
        </uni-forms>

        <uni-forms
            :modelValue="userContactInfo"
            label-position="top">
            <uni-forms-item label="昵称：" >
                <uni-easyinput v-model="userContactInfo.appellation"/>
            </uni-forms-item>
            <uni-forms-item label="注册邮箱：" >
                <uni-easyinput v-model="userContactInfo.phone"/>
            </uni-forms-item>
            <uni-forms-item label="注册邮箱：" >
                <uni-easyinput v-model="userContactInfo.qq"/>
            </uni-forms-item>
            <uni-forms-item label="注册邮箱：" >
                <uni-easyinput v-model="userContactInfo.wechat"/>
            </uni-forms-item>
            <uni-forms-item label="注册邮箱：" >
                <uni-easyinput v-model="userContactInfo.email"/>
            </uni-forms-item>
            <uni-forms-item label="注册邮箱：" >
                <uni-easyinput v-model="userContactInfo.address"/>
            </uni-forms-item>
            <uni-forms-item label="注册邮箱：" >
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
    computed:{
        user(){
            return this.$store.state.user;
        }
    },
    data(){
        return{
            faceImage:{},
            newUser:{
                nickName:"",
                email:"",
                face:"",
            },
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
        updateUser(){
            // 上传图片 由于异步的原因，可能没有上传完图片就开始上传其他数据，所以使用了settimeOut来进行同步操作，性能损失极大
            if(!JSON.stringify(this.faceImage) == "{}"){
                    uni.uploadFile({
                        url: this.$baseUrl + "user/addImg",
                        filePath:this.faceImage.url,
                        name:"file",
                        formData: {},
                        success: (res) => {
                            this.newUser.face+=JSON.parse(res.data).data[0];
                        }
                    });
                setTimeout(() => {
                    this.uploadOther();
                }, 5000);
            }else{
                this.uploadOther();
            }
        },
        uploadOther(){
            //上传其他数据
            uni.request({
                url: this.$baseUrl + "user/update",
                method: 'POST',
                data: {
                    id: this.user.id,
                    nickName:this.newUser.nickName,
                    email:this.newUser.email,
                    face:this.newUser.face,
                },
                success: (res) => {
                    console.log(res.data);
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
                    console.log(res)
                }
            })
        },
        select(e){
            this.faceImage = e.tempFiles[0];
        },
    }
}
</script>

<style lang="scss">
</style>