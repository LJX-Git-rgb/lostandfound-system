<!--后台我的信息页面-->

<template>
    <div style="padding:10px">
      <!--    新增-->
        <div style="margin: 10px 0">
          <el-button type="primary" @click="add">新增</el-button>
        </div>
      <!--    搜索-->
      <div style="margin: 10px 0">
        <el-input v-model="search" placeholder="请输入关键字" style="width: 20%" clearable></el-input>
        <el-button type="primary" style="margin-left: 5px" @click="load">搜索</el-button>
      </div>
      <!--操作数据-->
        <el-table :data="tableData" border stripe style="width: 100%">
          <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="id" label="ID" width="150"></el-table-column>
            <el-table-column prop="uid" label="Uid" width="150"></el-table-column>
            <el-table-column prop="name" label="管理员名" width="120"></el-table-column>
            <el-table-column prop="pwd" label="密码" width="150"></el-table-column>
            <el-table-column prop="phone" label="电话" width="300"></el-table-column>
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
            <el-form-item label="管理员名">
              <el-input v-model="form.name" style="width: 80%" />
            </el-form-item>
            <el-form-item label="密码">
              <el-input v-model="form.pwd" style="width: 80%" />
            </el-form-item>
            <el-form-item label="电话">
              <el-input v-model="form.phone" style="width: 80%" />
            </el-form-item>
          </el-form>
          <template #footer>
            <span class="dialog-footer">
              <el-button @click="dialogVisible = false">取消</el-button>
              <el-button type="primary" @click="save">确定</el-button>
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
      this.load()
  },

  methods: {

//查询方法
    load() {
      request.get("/api/adminUser", {
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

    add() {
      this.dialogVisible = true
      this.form = {}
    },

    save() {
      if (this.form.id) {  //更新
        request.put("/api/adminUser", this.form).then(res => {
          console.log(res)
            this.$message({
              type: "success",
              message: "更新成功"
            })
          this.load()  //刷新表格的数据
          this.dialogVisible = false   //关闭弹窗
        })
      } else {  //新增，用post是因为后台接口用的@PostMapping,要保持一致
        request.post("/api/adminUser", this.form).then(res => {
          console.log(res)
            this.$message({
              type: "success",
              message: "新增成功"
            })
          this.load()//刷新表格的数据
          this.dialogVisible = false   //关闭弹窗
        })
      }
    },

    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))  //避免先拷贝问题
      this.dialogVisible = true
    },

    handleDelete(id) {
      console.log(id)
      request.delete("/api/adminUser/" + id).then(res => {
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