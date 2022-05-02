<template>
    <div id="body">
        <swiper class="swiper" :indicator-dots="true" :autoplay="true" :interval="2000" :duration="500">
            <swiper-item v-for="(url, index) in goods.imageList" :key="index">
                <image :src="'../../static/image'  + url " alt="" mode='aspectFit'>
            </swiper-item>
        </swiper>
        <div id="goodsInfo">
            <uni-group title="注册信息">
                <uni-list>
                    <uni-list-item title="标题" :rightText='goods.title'/>
                    <uni-list-item title="描述" :rightText='goods.description'/>
                    <uni-list-item title="创建时间" :rightText='new Date(goods.createTime).format("yyyy-MM-dd hh:mm:ss").toString()'/>
                    <uni-list-item title="标签" :rightText='goods.tag'/>
                    <uni-list-item :title="option.state == 'true' ? '捡到地点' : '丢失地点'"
                                   :rightText='option.state == "true" ? goods.foundArea : goods.lostArea'/>
                    <uni-list-item :title="option.state == 'true' ? '捡到时间' : '丢失时间'"
                                   :rightText='option.state == "true" ? new Date(goods.foundTime).format("yyyy-MM-dd hh:mm:ss").toString() : new Date(goods.lostTime).format("yyyy-MM-dd hh:mm:ss").toString()'/>
                </uni-list>
            </uni-group>
        </div>

        <button v-if="own" @click="updateGoodsInfo">修改发布内容(no image)</button>
        <button v-if="own" @click="changeState">失主/东西已经找到
        </button>
        <template v-if="!own">
            <button id="submit" @click="submit">{{ option.state == "true" ? "这是我的" : "我捡到它了" }}</button>

            <div id="userContact">
                <uni-group title="主人联系方式(认证才可以查看)">
                    <uni-list>
                        <uni-list-item title="称呼" :rightText='userContactInfo.appellation'/>
                        <uni-list-item title="电话" :rightText='userContactInfo.phone'/>
                        <uni-list-item title="QQ号" :rightText='userContactInfo.qq'/>
                        <uni-list-item title="微信号" :rightText='userContactInfo.wechat'/>
                        <uni-list-item title="邮箱" :rightText='userContactInfo.email'/>
                        <uni-list-item title="地址" :rightText='userContactInfo.address'/>
                        <uni-list-item title="微博" :rightText='userContactInfo.microblogging'/>
                        <uni-list-item title="其他" :rightText='userContactInfo.other'/>
                    </uni-list>
                </uni-group>
            </div>

            <div id="feedback">
                <uni-group title="我要举报">
                    <uni-easyinput type="textarea" placeholder="举报内容"/>
                    <button @click="feedBack">举报</button>
                </uni-group>
            </div>
        </template>
    </div>
</template>

<script>
export default {
    data() {
        return {
            option: {},
            goods: {},
            userContactInfo: {},
            own:'',
        }
    },
    methods: {
        changeState(){
          uni.request({
              url: this.$baseUrl + 'generalgoods/changestate?flag=' + this.option.state + '&id=' + this.goods.id,
              method: 'GET',
              success: (res) => {
                  console.log(res);
              }
          })
        },
        updateGoodsInfo(){
            uni.navigateTo({url:'../myinfo/UpdateMyUpload?goods=' + encodeURIComponent(JSON.stringify(this.goods)) + "&state=" + this.option.state})
        },
        feedBack() {

        },
        submit() {
            uni.request({
                url: this.$baseUrl + 'user/searchUserContact?uid=' + this.goods.uid,
                method: 'GET',
                success: (res) => {
                    this.userContactInfo = res.data.data[0]
                }
            })
        }
    },
    onLoad(option) {
        this.option = option;
        var url = this.$baseUrl;
        if (option.state == "true") {
            url += "finds/findById?id=" + option.id;
        } else {
            url += "losts/findById?id=" + option.id;
        }
        uni.request({
            url: url,
            method: 'GET',
            success: (res) => {
                this.goods = res.data;
                this.own = this.goods.uid == this.$store.state.user.id;
            },
        })
    },
}
</script>

<style lang="scss" scoped>
#body {
    padding: 0rpx 20rpx;

    swiper {
        image {
            width: 100%;
            height: 100%;
        }
    }

    #goodsInfo {
        margin-top: 10rpx;
    }

    #submit {
        margin: 50rpx;
    }

    #feedback {
        margin: 0rpx 50rpx;
        margin-top: 30rpx;

        button {
            margin-top: 20rpx;
        }
    }
}
</style>