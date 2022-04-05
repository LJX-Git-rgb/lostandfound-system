<template>
    <div id="accountInfo">
        <span>您的信息还未完善</span>
        <el-progress :percentage="20" status="warning"></el-progress>

        <el-descriptions
            class="margin-top"
            title="个人信息（仅个人可见）"
            :column="2"
            border
            direction="horizontal"
        >

            <template slot="extra">
                <el-button type="primary" size="small">完善信息</el-button>
            </template>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-user"></i>用户名
                </template>
                kooriookami
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-mobile-phone"></i>
                    手机号
                </template>
                18100000000
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-location-outline"></i>
                    真实姓名
                </template>
                haha
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-tickets"></i>
                    电话
                </template>
                <el-tag size="small">学校</el-tag>
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    联系地址
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    联系地址
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    联系地址
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    联系地址
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    联系地址
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    联系地址
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    联系地址
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    联系地址
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>
        </el-descriptions>

        <hr>

        <el-descriptions
            class="margin-top"
            title="留给认领者或归还者的联系方式"
            :column="2"
            border
            direction="horizontal"
        >
            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-user"></i>称呼
                </template>
                haha
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-mobile-phone"></i>
                    手机号
                </template>
                18100000000
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-location-outline"></i>
                    邮箱
                </template>
                1612253221@qq.com
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-tickets"></i>
                    电话
                </template>
                <el-tag size="small">学校</el-tag>
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    微信号
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    微博
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    联系地址
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    邮编
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    其他
                </template>
                江苏省苏州市吴中区吴中大道 1188 号
            </el-descriptions-item>
        </el-descriptions>

        <hr>

    </div>
</template>

<script>
export default {
    methods: {}
};
</script>

<style lang="less" scoped>
#accountInfo {
    margin-top: 3%;
    padding: 0 13%;
    height: 70vh;

    .el-progress.el-progress--line {
        margin-bottom: 3%;
    }

    hr {
        margin: 3% 0 3% 0;
    }
}
</style>