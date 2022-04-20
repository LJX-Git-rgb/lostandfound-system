<template>
    <div id="body">
        <div id="content">
            <div id="header">
                <h3>{{ goods.title }}</h3>
                <div id="buttons">
                    <el-button type="success">认领</el-button>
                    <el-button type="error">举报</el-button>
                </div>
            </div>
            <hr>
            <div id="carousel-wrap">
                <el-carousel>
                    <el-carousel-item v-for="item in goods.imageList" :key="item">
                        <img :src="require('../../../../image' + item)" alt="">
                    </el-carousel-item>
                </el-carousel>
            </div>
            <div id="goodsInfo">
                <el-descriptions title="物品信息">
                    <el-descriptions-item label="详情描述">{{goods.description}}</el-descriptions-item>
                    <el-descriptions-item label="发现时间">{{ new Date(goods.foundTime).format("yyyy-MM-dd hh:mm:ss")}}</el-descriptions-item>
                    <el-descriptions-item label="发现地点">{{goods.foundArea.split('&').slice(0,1).toString()}}</el-descriptions-item>
                    <el-descriptions-item label="标签">
                        <el-tag size="small"  v-for="tag in goods.tag.split('&').slice(0,2)" id="tag">{{tag}}</el-tag>
                    </el-descriptions-item>
                    <el-descriptions-item label="记录创建时间">{{new Date(goods.createTime).format("yyyy-MM-dd hh:mm:ss")}}</el-descriptions-item>
                </el-descriptions>
            </div>
            <hr>
            <div id="userInfo">
                <el-descriptions title="个人信息">
                    <el-descriptions-item label="详情描述">{{goods.description}}</el-descriptions-item>
                    <el-descriptions-item label="发现时间">{{ goods.foundTime }}</el-descriptions-item>
                    <el-descriptions-item label="发现地点">{{goods.foundArea.split('&').slice(0,1).toString()}}</el-descriptions-item>
                    <el-descriptions-item label="标签">
                        <el-tag size="small"  v-for="tag in goods.tag.split('&').slice(0,2)" id="tag">{{tag}}</el-tag>
                    </el-descriptions-item>
                    <el-descriptions-item label="记录创建时间">{{goods.createTime}}</el-descriptions-item>
                </el-descriptions>
            </div>
        </div>
    </div>
</template>

<script>
Date.prototype.format = function(fmt) {
    var o = {
        "M+" : this.getMonth()+1,                 //月份
        "d+" : this.getDate(),                    //日
        "h+" : this.getHours(),                   //小时
        "m+" : this.getMinutes(),                 //分
        "s+" : this.getSeconds(),                 //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S" : this.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt)) {
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
    for(var k in o) {
        if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
    return fmt;
}

export default {
    data() {
        return {
            goods: {},
            otherGoodsList: [],
        }
    },
    computed: {
        url() {
            return this.$route.query.state + "s/findById"
        }
    },
    mounted() {
        console.log(this.$route.query);
        this.$axios({
            url: this.url,
            method: "get",
            params: {
                id: this.$route.query.id
            }
        }).then(res => {
            this.goods = res.data;
        })
    }
}
</script>

<style lang="less" scoped>
#body {
    #content {
        margin: 5%;
        margin-right: 30%;
        #header{
            margin-top: 3%;
            display: flex;
            justify-content: space-between;

            h3 {
                font-size: 25px;
            }
            #buttons{
            }
        }

        hr {
            margin-top: 2%;
        }

        #carousel-wrap {
            width: 50%;
            .el-carousel__item {
                img {
                    width: 100%;
                    height: 100%;
                }
            }
        }

        #goodsInfo,
        #userInfo {
            margin: 2%;
            #tag{
                margin-right: 5px;
            }
        }
    }
}
</style>