<template>
    <div id="goods-row">
        <el-row type="flex" justify="center">
            <el-col v-for="(o, index) in 3" :key="o" :offset="index > 0 ? 1 : 0">
                <a href="">
                    <el-card :body-style="{ padding: '10px' }">
                        <img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image">
                        <div id="card-text">
                            <span>好吃的汉堡</span>
                            <div class="bottom clearfix">
                            <time class="time">{{ currentDate }}</time>
                            </div>
                        </div>
                    </el-card>
                </a>
            </el-col>
        </el-row>
    </div>
</template>

<script>
export default {

}
</script>

<style>
    #goods-row{
        padding: 0 10%;
        border: 1px solid blue;
    }
    #card-text{
        padding: 14px;
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