<template>
    <div id="goods-row">
        <el-row type="flex" justify="center">
            <el-col v-for="(o, index) in 4" :key="o" :offset="index > 0 ? 1 : 0">
                <a :href="'lostgood?id=' + id">
                    <el-card :body-style="{ padding: '10px'}">
                        <img src="../assets/image/login_backImg.jpeg" class="image">
                        <div id="card-text">
                            <center>对图片的形容</center>
                        </div>
                    </el-card>
                </a>
            </el-col>
        </el-row>
    </div>
</template>

<script>
export default {
    data() {
        return {
            id:1,
        }
    },
}
</script>

<style lang="less" scoped>
    #goods-row{
        padding: 0 5%;

        #card-text{
            padding: 10px;
        }
    }
   
    /* element ui */
    .time {
    font-size: 13px;
        color: #999;
    }

    .bottom {
        margin-top: 13px;
        line-height: 12px;
    }

    .button {
        padding: 0;
        float: right;
    }

    .image {
        width: 100%;
        display: block;
    }

    .clearfix:before,
    .clearfix:after {
        display: table;
        content: "";
    }

    .clearfix:after {
        clear: both
    }
</style>