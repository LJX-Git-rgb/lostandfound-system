<!--后台失物招领/寻物启事管理页面-->

<template>
    <div id="goodsInfo">
      <!--    搜索-->
      <div style="margin: 10px 0">
        <el-input v-model="searchInput" placeholder="请输入标题、描述或区域关键字" style="width: 30%" clearable></el-input>
        <el-button type="primary" style="margin-left: 5px" @click="SearchGoods">搜索</el-button>
      </div>
<!--      操作数据-->
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
            <el-table-column  width="150" label="首图">
              <template #default="scope">
                <img :src="require('../../../../lostandfound-miniprogram/src/static/image' + scope.row.image.split('&')[0])" style="width: 100px">
              </template>
            </el-table-column>
            <el-table-column prop="description" label="详情描述" width="180"></el-table-column>
            <el-table-column prop='state' label="状态" width="50"></el-table-column>
            <el-table-column prop="createTime" label="发布日期" width="180"></el-table-column>
            <el-table-column :prop="isLostOrFind ? 'lostArea' : 'foundArea'" :label="isLostOrFind ? '捡到区域' : '丢失区域'" width="180"></el-table-column>
            <el-table-column :prop="isLostOrFind ? 'lostTime' : 'foundTime'" :label="isLostOrFind ? '捡到日期' : '丢失日期'" width="180"></el-table-column>
            <el-table-column fixed="right" label="操作">
                <template slot-scope="scope">
                  <el-popconfirm title="确认要移除吗?" @confirm="deleteGoods(scope.row)">
                    <template #reference>
                      <el-button type="danger" size="small" style="margin-left: 10px">移除</el-button>
                    </template>
                  </el-popconfirm>
                </template>
            </el-table-column>
        </el-table>
<!--      分页-->
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
          searchInput:"",

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

      SearchGoods(){
        var url;
        if (!this.isLostOrFind){
          url="/api/finds/search"
        }else{
          url="/api/losts/search"
        }
        this.$axios({
          url:url,
          method:'get',
          params:{
            searchInput: this.searchInput,
          }
        }).then(res=>{
          console.log(res);
          if (!this.isLostOrFind){
            this.findGoodsList = res.data
          }else {
            this.lostGoodsList = res.data
          }
        })

      },

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
            console.log("haha",this.isLostOrFind)
            this.page.currentPage = val;
            if (!this.isLostOrFind) {
                this.showFoundGoods();
            }else{
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
                url: '/api/generalgoods/findGoodsByPage',
                params: {
                    currentPage: this.findPage.currentPage,
                    pageSize: this.findPage.pageSize,
                    flag:true
                }
            }).then(res => {
                console.log(res.data)
                this.findGoodsList = res.data;
            }).catch(err => {
                this.$message.error("服务器错误")
            })
        },
        countFoundGoodsTotal() {
            this.$axios({
                method: 'get',
                url: '/api/generalgoods/countGoods',
                params:{
                    flag:true
                }
            }).then(res => {
                this.findPage.total = res.data;
            })
        },

        showLostGoods() {
            if (this.lostPage.total == 0) {
                this.countLostGoodsTotal();
            }
            this.$axios({
                method: 'get',
                url: '/api/generalgoods/findGoodsByPage',
                params: {
                    currentPage: this.lostPage.currentPage,
                    pageSize: this.lostPage.pageSize,
                    flag:false
                }
            }).then(res => {
                console.log(res)
                this.lostGoodsList = res.data;
            }).catch(err => {
                this.$message.error("服务器错误")
            })
        },
        countLostGoodsTotal() {
            this.$axios({
                method: 'get',
                url: '/api/generalgoods/countGoods',
                params:{
                    flag:false
                }
            }).then(res => {
                this.lostPage.total = res.data;
            })
        },

        deleteGoods(row){
            var url;
            if (!this.isLostOrFind){
                url="/api/finds/delete"
            }else{
                url="/api/losts/delete"
            }
          this.$axios({
              url:url,
              method:'get',
              params:{
                id: row.id,
              }
          }).then(res=>{
              if (res.data.code == "200"){
                  this.$message.success("删除成功");
              }
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
#goodsInfo {
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