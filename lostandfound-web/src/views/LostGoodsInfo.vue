<template>
    <div id="body">
        <div>
            <h3>失物招领详情</h3>
        <hr>
        <div id="goodsInfo">
            <el-descriptions title="物品信息">
                <el-descriptions-item label="用户名">kooriookami</el-descriptions-item>
                <el-descriptions-item label="手机号">18100000000</el-descriptions-item>
                <el-descriptions-item label="居住地">苏州市</el-descriptions-item>
                <el-descriptions-item label="备注">
                <el-tag size="small">学校</el-tag>
                </el-descriptions-item>
                <el-descriptions-item label="联系地址">江苏省苏州市吴中区吴中大道 1188 号</el-descriptions-item>
            </el-descriptions>
            <hr>
                <el-descriptions title="物品信息">
                    <el-descriptions-item label="用户名">kooriookami</el-descriptions-item>
                    <el-descriptions-item label="手机号">18100000000</el-descriptions-item>
                    <el-descriptions-item label="居住地">苏州市</el-descriptions-item>
                    <el-descriptions-item label="备注">
                    <el-tag size="small">学校</el-tag>
                    </el-descriptions-item>
                    <el-descriptions-item label="联系地址">江苏省苏州市吴中区吴中大道 1188 号</el-descriptions-item>
                    <el-descriptions-item label="用户名">kooriookami</el-descriptions-item>
                    <el-descriptions-item label="手机号">18100000000</el-descriptions-item>
                    <el-descriptions-item label="居住地">苏州市</el-descriptions-item>
                    <el-descriptions-item label="备注">
                    <el-tag size="small">学校</el-tag>
                    </el-descriptions-item>
                    <el-descriptions-item label="联系地址">江苏省苏州市吴中区吴中大道 1188 号</el-descriptions-item>
                    <el-descriptions-item label="用户名">kooriookami</el-descriptions-item>
                    <el-descriptions-item label="手机号">18100000000</el-descriptions-item>
                    <el-descriptions-item label="居住地">苏州市</el-descriptions-item>
                    <el-descriptions-item label="备注">
                    <el-tag size="small">学校</el-tag>
                    </el-descriptions-item>
                    <el-descriptions-item label="联系地址">江苏省苏州市吴中区吴中大道 1188 号</el-descriptions-item>
                </el-descriptions>
            <hr>
                <el-descriptions title="物品信息">
                    <el-descriptions-item label="用户名">kooriookami</el-descriptions-item>
                    <el-descriptions-item label="手机号">18100000000</el-descriptions-item>
                    <el-descriptions-item label="居住地">苏州市</el-descriptions-item>
                    <el-descriptions-item label="备注">
                    <el-tag size="small">学校</el-tag>
                    </el-descriptions-item>
                    <el-descriptions-item label="联系地址">江苏省苏州市吴中区吴中大道 1188 号</el-descriptions-item>
                    <el-descriptions-item label="用户名">kooriookami</el-descriptions-item>
                    <el-descriptions-item label="手机号">18100000000</el-descriptions-item>
                    <el-descriptions-item label="居住地">苏州市</el-descriptions-item>
                    <el-descriptions-item label="备注">
                    <el-tag size="small">学校</el-tag>
                    </el-descriptions-item>
                    <el-descriptions-item label="联系地址">江苏省苏州市吴中区吴中大道 1188 号</el-descriptions-item>
                    <el-descriptions-item label="用户名">kooriookami</el-descriptions-item>
                    <el-descriptions-item label="手机号">18100000000</el-descriptions-item>
                    <el-descriptions-item label="居住地">苏州市</el-descriptions-item>
                    <el-descriptions-item label="备注">
                    <el-tag size="small">学校</el-tag>
                    </el-descriptions-item>
                    <el-descriptions-item label="联系地址">江苏省苏州市吴中区吴中大道 1188 号</el-descriptions-item>
                </el-descriptions>

        </div>
        </div>
    </div>
</template>

<script>
export default {
    mounted(){
        console.log(this.$route.query)
    }
}
</script>
<style lang="less" scoped>
    #body {
        div{
            margin: 3%;

            h3{
                margin-top: 3% ;
                display: block;
                font-size: 25px;
            }
            hr{
                margin-top: 2%;
            }
            #goodsInfo{
                margin: 2%;
            }
        }
    }
</style>