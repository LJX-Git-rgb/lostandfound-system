<template>
    <div id="timeBlock">
        <span>我的发布 : </span>
        <el-timeline>
            <el-timeline-item v-for="item in tableData" :key="item.id" :timestamp="item.createTime" placement="top">
                <a href="#">
                    <el-card>
                        <img :src="item.image" alt="" id="cardImg">
                        <div id="content">
                            <span>{{item.title}}</span>
                            <h3>{{item.description}}</h3>
                            <br>
                            <p>提交于 {{item.createTime}}</p>
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
            tableData: [],
        }
    },
    mounted() {
        this.$axios({
            method:"get",
            url:"/finds/byUser",
            params:{
                uid:this.$store.state.user.id
            }
        }).then(res => {
            this.tableData = res.data;
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
        width: 40%;
        height: 40%;
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