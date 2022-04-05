<template>
    <div id="timeBlock">
        <span>我的发布 : </span>
        <el-timeline>
            <el-timeline-item v-for="(o,index) in tableData" :key="index" :timestamp="o.timestamp" placement="top">
                <a href="#">
                    <el-card>
                        <img :src=o.imgUrl alt="" id="cardImg">
                        <div id="content">
                            <h3>更新 Github 模板</h3>
                            <br>
                            <p>王小虎 提交于 2018/4/12 20:46</p>
                        </div>
                    </el-card>
                </a>
                <!--                <span id="delete">删除</span>-->
            </el-timeline-item>
        </el-timeline>
        <a id="archor">
            哈哈
        </a>
    </div>
</template>

<script>
export default {
    name: "MyPost",
    data() {
        return {
            tableData: [
                {
                    timestamp: "2018/4/12",
                    description: "这是第一条提交记录",
                    imgUrl: require("../../assets/image/login_backImg.jpeg")
                },
                {
                    timestamp: "2018/4/13",
                    description: "这是第二条提交记录",
                    imgUrl: require("../../assets/image/login_backImg.jpeg")
                },
                {
                    timestamp: "2018/4/14",
                    description: "这是第三条提交记录",
                    imgUrl: require("../../assets/image/login_backImg.jpeg")
                },
                {
                    timestamp: "2018/4/15",
                    description: "这是第四条提交记录",
                    imgUrl: require("../../assets/image/login_backImg.jpeg")
                },
                {
                    timestamp: "2018/4/12",
                    description: "这是第一条提交记录"
                },
                {
                    timestamp: "2018/4/13",
                    description: "这是第二条提交记录"
                },
                {
                    timestamp: "2018/4/14",
                    description: "这是第三条提交记录"
                },
                {
                    timestamp: "2018/4/15",
                    description: "这是第四条提交记录"
                },
            ],
        }
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