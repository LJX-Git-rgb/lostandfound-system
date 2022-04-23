<!--后台失物招领管理页面-->

<template>
    <div id="userInfo">
        <el-table
            :data="tableData"
            border
            :fit="true"
            :highlight-current-row="true"
            style="width: 100%"
            ref="multipleTable"
            tooltip-effect="dark"
            @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="id" label="ID" width="60" sortable=""></el-table-column>
            <el-table-column prop="title" label="标题" width="120"></el-table-column>
            <el-table-column prop="description" label="详情描述" width="180"></el-table-column>
            <el-table-column prop='state' label="状态" width="50"></el-table-column>
            <el-table-column prop="createTime" label="发布日期" width="180"></el-table-column>
            <el-table-column :prop="isLostOrFind ? 'foundArea' : 'lostArea'" :label="isLostOrFind ? '捡到区域' : '丢失区域'" width="180"></el-table-column>
            <el-table-column :prop="isLostOrFind ? 'foundTime' : 'lostTime'" :label="isLostOrFind ? '捡到日期' : '丢失日期'" width="180"></el-table-column>
            <el-table-column fixed="right" label="操作">
                <template slot-scope="scope">
                    <div style="display: flex">
                        <el-button @click="updateUser(scope.row)" type="primary" size="small">编辑</el-button>
                        <el-button @click="updateUser(scope.row)" type="danger" size="small">移除</el-button>
                    </div>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="page.currentPage"
            :page-sizes="page.pageSizes"
            :page-size="page.pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="page.total">
        </el-pagination>
    </div>
</template>

<script>
export default {
    data() {
        return {
            input: '',
            select: '',

            // table

            findGoodsList:[],
            lostGoodsList:[],

            // page
            findPage: {
                total: 0,
                currentPage: 0,
                pageSizes: [5, 10, 20, 50],
                pageSize: 5,
            },
            lostPage: {
                total: 0,
                currentPage: 0,
                pageSizes: [5, 10, 20, 50],
                pageSize: 5,
            },
        }
    },
    computed:{
        isLostOrFind(){
            return this.$route.fullPath.split('?')[1] == 'lost';
        },
        tableData(){
            return this.isLostOrFind ? this.lostGoodsList : this.findGoodsList
        },
        page(){
            return this.isLostOrFind ? this.lostPage : this.findPage
        }

    },
    methods: {
        handleSizeChange(val) {
            console.log(`每页 ${val} 条`);
            if (this.isLostOrFind) {
                this.findPage.pageSize = val
                this.showFoundGoods();
            }else{
                this.lostPage.pageSize = val
                this.showLostGoods();
            }
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
            this.page.currentPage = val;
            if (this.isLostOrFind) {
                this.findPage.pageSize = val
                this.showFoundGoods();
            }else{
                this.lostPage.pageSize = val
                this.showLostGoods();
            }
        },
        handleSelectionChange(val) {
            this.multipleSelection = val;
        },

        // axios function
        showFoundGoods() {
            if (this.findPage.total == 0) {
                this.countFoundGoodsTotal();
            }
            this.$axios({
                method: 'get',
                url: '/generalgoods/findGoodsByPage',
                params: {
                    currentPage: this.findPage.currentPage,
                    pageSize: this.findPage.pageSize,
                    flag:true
                }
            }).then(res => {
                this.findGoodsList = res.data;
            }).catch(err => {
                this.$message.error("服务器错误")
            })
        },
        countFoundGoodsTotal() {
            this.$axios({
                method: 'get',
                url: '/generalgoods/countGoods',
                params:{
                    flag:true
                }
            }).then(res => {
                this.findGoodsList.total = res.data;
            })
        },

        showLostGoods() {
            if (this.lostPage.total == 0) {
                this.countLostGoodsTotal();
            }
            this.$axios({
                method: 'get',
                url: '/generalgoods/findGoodsByPage',
                params: {
                    currentPage: this.lostPage.currentPage,
                    pageSize: this.lostPage.pageSize,
                    flag:false
                }
            }).then(res => {
                this.lostGoodsList = res.data;
            }).catch(err => {
                this.$message.error("服务器错误")
            })
        },
        countLostGoodsTotal() {
            this.$axios({
                method: 'get',
                url: '/generalgoods/countGoods',
                params:{
                    flag:false
                }
            }).then(res => {
                this.lostPage.total = res.data;
            })
        },
    },
    mounted() {
        this.showLostGoods();
        this.showFoundGoods();
    }
}
</script>

<style lang="less" scoped>
#userInfo {
    margin: 10px;
    flex: 1;
    #userButton {
        margin-bottom: 10px;
        #select{
            margin-top: 10px;
            width: 600px;
        }
    }
}
</style>