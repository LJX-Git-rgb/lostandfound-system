<!--后台举报管理页面-->

<template>
  <div style="padding:10px">
    <!--    搜索-->
    <div style="margin: 10px 0">
      <el-input v-model="search" placeholder="请输入ID" style="width: 20%" clearable></el-input>
      <el-button type="primary" style="margin-left: 5px" @click="load">搜索</el-button>
    </div>
    <!--操作数据-->
    <el-table :data="tableData" border stripe style="width: 100%">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="150"></el-table-column>
      <el-table-column prop="uid" label="用户ID" width="150"></el-table-column>
      <el-table-column prop="content" label="内容" width="300"></el-table-column>
      <el-table-column prop="lid" label="寻物信息" width="150"></el-table-column>
      <el-table-column prop="fid" label="失物信息" width="150"></el-table-column>
      <el-table-column prop="state" label="状态" width="150"></el-table-column>
      <el-table-column fixed="right" label="操作" width="150">
        <template #default="scope">
          <el-button @click="tackle(scope.row)" type="primary" size="small">处理</el-button>
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
    this.load()
  },

  methods: {

//查询方法
    load() {
      request.get("/api/feedback", {
        params: {
          pageNum: this.currentPage,
          pageSize: this.pageSize,
          search: this.search
        }
      }).then(res => {
        console.log(res)
        this.tableData = res.records //将后台请求到的值放在tableData里，实现数据库的渲染
        this.total = res.total
      })
    },

    tackle(row) {
      row.state = 1
      console.log(row)
      var form = JSON.parse(JSON.stringify(row))  //避免先拷贝问题
      this.$axios({
        method: "post",
        url: "/api/feedback/update",
        data: {
          id:row.id,
          uid:row.uid,
          content:row.content,
          lid:row.lid,
          fid:row.fid,
          state:row.state,
        }
      }).then(res => {
        console.log(res)
        this.$message({
          type: "success",
          message: "处理成功"
        })
        this.load()  //刷新表格的数据
      })
    },

    handleDelete(id) {
      console.log(id)
      request.delete("/api/feedback/" + id).then(res => {
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
  }
}
</script>