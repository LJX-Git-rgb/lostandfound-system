<!--后台公告管理页面-->

<template>
    <div style="padding:10px">
      <!--    新增-->
      <div style="margin: 10px 0">
        <el-button type="primary" @click="add">新增</el-button>
        <el-button type="primary" @click="upLoad">导入</el-button>
        <el-button type="primary" @click="downLoad">导出</el-button>
      </div>
      <!--    搜索-->
      <div style="margin: 10px 0">
        <el-input v-model="search" placeholder="请输入关键字" style="width: 50%" clearable></el-input>
        <el-button type="primary" style="margin-left: 5px" @click="load">搜索</el-button>
      </div>
      <!--操作数据-->
        <el-table :data="tableData" border stripe style="width: 100%">
          <el-table-column type="selection" width="55"></el-table-column>
          <el-table-column prop="id" label="ID" width="150" sortable=""></el-table-column>
          <el-table-column prop="content" label="公告内容" width="700"></el-table-column>
            <el-table-column fixed="right" label="操作" width="150">
              <template #default="scope">
                <el-button @click="handleEdit(scope.row)" type="primary" size="small">编辑</el-button>
                <el-popconfirm title="确认删除吗?" @confirm="handleDelete(scope.row.id)">
                  <template #reference>
                    <el-button type="danger" size="small" style="margin-left: 10px">删除</el-button>
                  </template>
                </el-popconfirm>
              </template>
            </el-table-column>
        </el-table>

      <!--    分页-->
      <div style="margin: 10px 0">
        <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :page-sizes="[5,10,20]"
            :page-size="pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="total">
        </el-pagination>

        <!--弹窗-->
        <el-dialog :visible.sync="dialogVisible" title="提示" width="30%">
          <el-form :model="form" label-width="120px">
            <el-form-item label="输入公告内容">
              <el-input v-model="form.content" type="textarea" style="width: 100%" />
            </el-form-item>
          </el-form>
          <template #footer>
              <span class="dialog-footer">
                <el-button @click="dialogVisible = false">取消</el-button>
                <el-button type="primary" @click="save">发布</el-button>
              </span>
          </template>
        </el-dialog>
      </div>

    </div>
</template>

<script>
import request from "@/components/utils/request";

export default {
    data() {
        return {
          form:{},
          search:'',
          tableData: [],
          currentPage:1,
          pageSize:10,
          total:0,
          dialogVisible : false
        }
    },

  created() {
    this.load();
  },

    methods: {

      load(){
        request.get("/api/notice", {
          params: {
            pageNum: this.currentPage,
            pageSize: this.pageSize,
            search: this.search
          }
        }).then(res => {
          console.log(res)
          this.tableData = res.data.records //将后台请求到的值放在tableData里，实现数据库的渲染
          this.total = res.data.total
        })
      },

      add(){
        this.dialogVisible = true
        this.form = {}
      },

      save(){

      },

      handleEdit(row){
        this.form = JSON.parse(JSON.stringify(row))  //避免先拷贝问题
        this.dialogVisible = true
      },

      handleDelete(id){
        console.log(id)
        request.delete("/api/admin/" + id).then(res => {
          if (res.code === '0') {
            this.$message({
              type: "success",
              message: "删除成功"
            })
          } else {
            this.$message({
              type: "error",
              message: res.msg
            })
          }
          this.load()   //删除之后，重新加载表格中的数据
        })
      },

      handleSizeChange(pageSize) {   //改变当前每页的个数时触发
        this.pageSize = pageSize
        this.load()
      },
      handleCurrentChange(pageNum) {   //改变当前页码触发
        this.currentPage = pageNum
        this.load()
      },
    },
}
</script>

<style lang="less" scoped>
#userInfo {
    margin: 10px;

    #userButton {
        margin-bottom: 10px;
    }
}

//#select{
//    width: 600px;
//    margin-top: 15px;
//}
</style>