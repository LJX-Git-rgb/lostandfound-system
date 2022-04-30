<template>
    <div id="timeBlock">
        <span v-if="lostOrFind">我发布的寻物启事 : </span>
        <span v-if="!lostOrFind">我发布的失物招领 : </span>
        <el-timeline>
            <el-timeline-item v-for="item in tableData" :key="item.id" :timestamp="new Date(item.createTime).format('yyyy-MM-dd hh:mm:ss')" placement="top">
                <a href="#">
                    <el-card>
                        <img :src="require('../../../../lostandfound-miniprogram/src/static/image' + item.imageList[0])" alt="" id="cardImg">
                        <div id="content">
                            <span>{{item.title}}</span>
                            <h3>{{item.description}}</h3>
                            <br>
                            <p>提交于 {{new Date(item.createTime).format("yyyy-MM-dd hh:mm:ss")}}</p>
                        </div>
                    </el-card>
                </a>
                <!--                <span id="delete">删除</span>-->
            </el-timeline-item>
        </el-timeline>
        <a id="archor">
            广告位招租
        </a>
    </div>
</template>

<script>
export default {
    name: "MyPost",
    data() {
        return {
            findData: [],
            lostData: [],
        }
    },
    computed: {
        lostOrFind(){
            return this.$route.fullPath.split('?')[1] == 'lost'
        },
        tableData(){
            if (this.lostOrFind){
                return this.lostData;
            }else{
                return this.findData;
            }
        }
    },
    mounted() {
        this.$axios({
            method:"get",
            url:"/api/finds/byUser",
            params:{
                uid:this.$store.state.user.id
            }
        }).then(res => {
            this.findData = res.data;
        })
        this.$axios({
            method:"get",
            url:"/api/losts/byUser",
            params:{
                uid:this.$store.state.user.id
            }
        }).then(res => {
            this.lostData = res.data;
        })
    }
}
</script>

<style lang="less" scoped>
#timeBlock {
    padding: 30px 250px 0px 130px;

    span {
        font-size: 24px;
        margin-bottom: 30px;
        display: inline-block;
        color: #1092ed;
    }

    /deep/ .el-timeline {
        padding-left: 50px;
        padding-right: 230px;
    }

    /deep/ .el-card__body {
        display: flex;
        border: 1px solid;

    }

    #cardImg {
        width: 20%;
        height: 20%;
    }

    #archor {
        display: block;
        width: 230px;
        height: 400px;
        background-color: red;
        position: fixed;
        top: 35%;
        right: 9%;
    }

    #content {
        text-align: center;
        margin-left: 15px;
    }

    #delete {
        position: relative;
        float: right;
        top: -120px;
        font-size: 14px;
        display: inline-block;
    }
}
</style>