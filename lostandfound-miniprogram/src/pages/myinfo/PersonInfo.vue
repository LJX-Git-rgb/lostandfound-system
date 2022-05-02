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
            <button>认证</button>
            <button>完善信息</button>
        </uni-group>
        <uni-group title="联系方式(可被看到)" margin-top="20">
            <uni-list>
                <uni-list-item title="称呼" :rightText="userContactInfo.appellation" />
				<uni-list-item title="电话" :rightText="userContactInfo.phone" />
				<uni-list-item title="QQ" :rightText="userContactInfo.qq" />
				<uni-list-item title="微信" :rightText="userContactInfo.wechat" />
				<uni-list-item title="邮箱" :rightText="userContactInfo.email" />
				<uni-list-item title="所在地址" :rightText="userContactInfo.address" />
				<uni-list-item title="微博" :rightText="userContactInfo.microblogging" />
				<uni-list-item title="其他" :rightText="userContactInfo.other" />
		    </uni-list>
		</uni-group>
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
    }
}
</script>

<style lang="scss">
    #body{
    }
</style>