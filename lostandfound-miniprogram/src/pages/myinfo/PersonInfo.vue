<template>
    <div id="body">
        <uni-group title="注册信息">
            <uni-list>
				<uni-list-item title="昵称" :rightText="user.nickName" />
				<uni-list-item title="性别" :rightText="user.gender" />
				<uni-list-item title="注册邮箱" :rightText="user.email" />
				<uni-list-item title="创建时间" :rightText="new Date(user.createTime).format('yyyy-MM-dd hh:mm:ss').toString()" />
				<uni-list-item title="更新时间" :rightText="new Date(user.updateTime).format('yyyy-MM-dd hh:mm:ss').toString()" />
			</uni-list>
        </uni-group>
        <uni-group title="联系方式(可被看到)" margin-top="20">
            <uni-list>
                <uni-list-item title="称呼" :rightText="userContactInfo.appellation" />
				<uni-list-item title="电话" :rightText="userContactInfo.phone" />
				<uni-list-item title="QQ" :rightText="userContactInfo.qq" />
				<uni-list-item title="微信" :rightText="userContactInfo.wechat" />
				<uni-list-item title="邮箱" :rightText="userContactInfo.email" />
				<uni-list-item title="所在地址" :rightText="userContactInfo.address" />
				<uni-list-item title="其他" :rightText="userContactInfo.other" />
		    </uni-list>
		</uni-group>

        <uni-row>
            <uni-col v-if="user.userRole == 1 " :span="8" :push="2">
                <button @click="$refs.inputDialog.open('bottom')">身份认证</button>
            </uni-col>
            <uni-col :span="user.userRole == 1 ? 8 : 20" :push="user.userRole == 1 ? 6 : 2">
                <button @click="updateUser">完善信息</button>
            </uni-col>
        </uni-row>
<!--        dialog-->
        <uni-popup ref="inputDialog" type="dialog" :animation="false" :mask-click = "false" background-color="#ccc" >
                <uni-forms  ref="form" :modelValue="identityData" validate-trigger="bind">
                    <uni-forms-item name="age" label="年龄">
                        <uni-easyinput v-model="identityData.name" placeholder="输入姓名"/>
                    </uni-forms-item>
                    <uni-forms-item  name="email" label="邮箱">
                        <uni-easyinput v-model="identityData.idNumber" placeholder="输入身份证号"/>
                    </uni-forms-item>
                    <button type="primary" @click="dialogInputConfirm">授权登录</button>
                </uni-forms>
        </uni-popup>
    </div>
</template>

<script>
export default {
    computed:{
        user() {
            return this.$store.state.user;
        }
    },
    data() {
        return {
            userContactInfo:{},
            identityData:{
                uid:this.$store.state.user.id,
                name:'',
                idNumber:''
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
        dialogInputConfirm() {
            uni.request({
                url:this.$baseUrl + 'approve',
                method:'POST',
                data:{
                    uid:this.identityData.uid,
                    name: this.identityData.name,
                    idNumber: this.identityData.idNumber,
                },
                success: res => {
                    uni.request({
                        url: this.$baseUrl + 'user/changeRole',
                        method:'GET',
                        data:{
                            email: this.user.email,
                            role:2
                        },
                        success: res => {
                            if (res.data.code == "200") {
                                uni.showToast({
                                    title: "恭喜你认证成功"
                                })
                                this.$refs.inputDialog.close();
                                this.$store.state.user.userRole = 2;
                                this.user.userRole = 2;
                                wx.setStorageSync("userInfo",JSON.stringify(this.user));
                            }else{
                                uni.showToast({
                                    title: res.data.message
                                })
                            }
                        }
                    })
                }
            })
        },
        updateUser(){
            uni.navigateTo({url:'/pages/myinfo/UpdateMyInfo'})
        }
    },
}
</script>

<style lang="scss">
    #body{
    }
</style>