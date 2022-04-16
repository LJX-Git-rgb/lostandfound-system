<template>
    <div id="goods-row">
        <el-row type="flex" justify="center">
            <el-col v-for="(item, index) in list" :key="item.id" :offset="index > 0 ? 1 : 0">
                <a :href="'lostgood?id=' + item.id">
                    <el-card :body-style="{ padding: '10px'}">
                        <img :src="require('../../../../image/foundgoods/' + item.image)" class="image">
                        <div id="card-text">
                            {{item.title}}
                        </div>
                    </el-card>
                </a>
            </el-col>
        </el-row>
    </div>
</template>

<script>
export default {
    props:['list'],
}
</script>

<style lang="less" scoped>
#goods-row {
    padding: 0 5%;

    #card-text {
        padding: 10px;
        text-align: center;
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