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
                <el-button v-if="user.userRole == 1" type="success" size="small" @click="approve">认证</el-button>
                <el-button type="primary" size="small" @click="completed">完善信息</el-button>
            </template>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-user"></i>用户名
                </template>
                {{user.nickName}}
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-mobile-phone"></i>
                    邮箱
                </template>
                {{user.email}}
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    性别
                </template>
                {{user.gender}}
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    用户权限
                </template>
                {{ role }}

            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    创建时间
                </template>
                {{user.createTime}}
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    上次更新时间
                </template>
                {{user.updateTime}}
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    我的头像
                </template>
                <el-image v-if='user.face.split("/")[1] != "face"' :src="user.face" style="height: 100px;"></el-image>
                <el-image v-if='user.face.split("/")[1] == "face"' :src="require('../../../../lostandfound-miniprogram/src/static/image' + user.face)" style="height: 100px;"></el-image>
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
                {{ userContactInfo.appellation }}
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-mobile-phone"></i>
                    手机号
                </template>
                {{ userContactInfo.phone }}
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-location-outline"></i>
                    邮箱
                </template>
                {{ userContactInfo.email}}
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    微信号
                </template>
                {{ userContactInfo.wechat }}
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    联系地址
                </template>
                {{ userContactInfo.address }}
            </el-descriptions-item>

            <el-descriptions-item>
                <template slot="label">
                    <i class="el-icon-office-building"></i>
                    其他
                </template>
                {{ userContactInfo.other }}
            </el-descriptions-item>
        </el-descriptions>

        <hr>

      <!--完善信息弹窗-->
      <el-dialog :visible.sync="CompleteDialogVisible" title="提示" width="30%">
        <el-form label-width="120px">
          <el-form-item label="用户名">
            <el-input v-model="CompleteForm.nickName" style="width: 80%" />
          </el-form-item>
          <el-form-item label="性别">
            <el-radio v-model="CompleteForm.gender" label="男">男</el-radio>
            <el-radio v-model="CompleteForm.gender" label="女">女</el-radio>
          </el-form-item>
          <el-form-item label="邮箱">
            <el-input v-model="CompleteForm.email" style="width: 80%"/>
          </el-form-item>
          <el-form-item label="头像">
            <el-upload
                class="upload-demo"
                action
                :on-change="handleChange"
                :on-remove="handleRemove"
                :auto-upload="false"
                :file-list="fileList"
                limit="1">
              <el-button size="small" type="primary">点击上传</el-button>
              <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
            </el-upload>
          </el-form-item>
        </el-form>
        <template #footer>
      <span class="dialog-footer">
        <el-button @click="CompleteDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="CompletedUserInfo">确定</el-button>
      </span>
        </template>
      </el-dialog>

      <!--认证信息弹窗-->
      <el-dialog :visible.sync="ApproveDialogVisible" title="提示" width="30%">
        <el-form
            label-width="120px"
            :rules="rules"
            ref="add"
            class="formDetails formDetailsNew">
          <el-form-item label="姓名:">
            <el-input v-model="ApproveForm.name" style="width: 80%" />
          </el-form-item>
          <el-form-item label="身份证号:" prop="identitytionId" :label-width="formLabelWidth">
            <el-input v-model="ApproveForm.idNumber" placeholder="请输入身份证号" onkeyup="this.value=this.value.replace(/[^\X0-9]/g, '')"/>
          </el-form-item>
        </el-form>
        <template #footer>
      <span class="dialog-footer">
        <el-button @click="ApproveDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="approveRole">确定</el-button>
      </span>
        </template>
      </el-dialog>

    </div>
</template>

<script>
import request from "@/components/utils/request";

export default {
    data(){
      var checkIdentitytionId = (rule, value, callback) => {
        if (!value) {
          return callback(new Error("身份证号不能为空"));
        }
        if (!/(^\d{15}$)|(^\d{17}(\d|X|x)$)/.test(value)) {
          callback(new Error("你输入的身份证长度或格式错误"));
        }
        //身份证城市
        var aCity = {
          11: "北京",
          12: "天津",
          13: "河北",
          14: "山西",
          15: "内蒙古",
          21: "辽宁",
          22: "吉林",
          23: "黑龙江",
          31: "上海",
          32: "江苏",
          33: "浙江",
          34: "安徽",
          35: "福建",
          36: "江西",
          37: "山东",
          41: "河南",
          42: "湖北",
          43: "湖南",
          44: "广东",
          45: "广西",
          46: "海南",
          50: "重庆",
          51: "四川",
          52: "贵州",
          53: "云南",
          54: "西藏",
          61: "陕西",
          62: "甘肃",
          63: "青海",
          64: "宁夏",
          65: "新疆",
          71: "台湾",
          81: "香港",
          82: "澳门",
          91: "国外"
        };
        if (!aCity[parseInt(value.substr(0, 2))]) {
          callback(new Error("你的身份证地区非法"));
        }
        // 出生日期验证
        var sBirthday = (
                value.substr(6, 4) +
                "-" +
                Number(value.substr(10, 2)) +
                "-" +
                Number(value.substr(12, 2))
            ).replace(/-/g, "/"),
            d = new Date(sBirthday);
        if (
            sBirthday !=
            d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate()
        ) {
          callback(new Error("身份证上的出生日期非法"));
        }

        // 身份证号码校验
        var sum = 0,
            weights = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2],
            codes = "10X98765432";
        for (var i = 0; i < value.length - 1; i++) {
          sum += value[i] * weights[i];
        }
        var last = codes[sum % 11]; //计算出来的最后一位身份证号码
        if (value[value.length - 1] != last) {
          callback(new Error("你输入的身份证号非法"));
        }
        callback();
      };
        return{
          user:this.$store.state.user,
          userContactInfo:{},
          ApproveForm:{
            name:"",
            idNumber: "",
          },
          CompleteForm:{},
          CompleteDialogVisible:false,
          ApproveDialogVisible:false,
          fileList:[],
          //校验规则
          rules: {
            identitytionId: [
              { validator: checkIdentitytionId , trigger: "blur" }
            ]
          }
        }
    },
    mounted() {
        this.$axios({
            url:'/api/user/searchUserContact?uid=' + this.user.id,
            method:'GET',
        }).then( res => {
            console.log(res);
            this.userContactInfo = res.data.data[0];
        })
    },

  methods:{
    approve(){
      this.ApproveDialogVisible=true
      this.ApproveForm={}
    },

    completed(){
      this.CompleteDialogVisible=true
      this.CompleteForm={}
    },

    approveRole() {
      this.ApproveForm.uid = this.user.id;
      request.post("/api/approve", this.ApproveForm).then(res => {
        if (res.code === '200') {
         this.$axios({
           url:"/api/user/changeRole",
           method:'get',
           params:{
             role:2,
             email:this.$store.state.user.email
           }
         }).then(res=>{
           this.$message.success('认证成功')
         })
        } else {
          this.$message({
            type: "error",
            message: res.msg
          })
        }
        this.ApproveDialogVisible = false   //关闭弹窗
      })
    },

    CompletedUserInfo(){
      //上传头像，成功后上传其他信息
      if (this.fileList.length == 0) {
        var user = this.user;
        user.nickName = this.CompleteForm.nickName;
        user.email = this.CompleteForm.email;
        request.post('/api/user/updateUser', user).then(res => {
          this.CompleteDialogVisible = false;
        })
      }else{
        var formData = new FormData()
        formData.append("file",this.fileList[0].raw)
        this.$axios.post('/api/user/addImg', formData)
            //判断上传是否成功，成功返回一个img的地址然后请求后台添加其他数据
            .then(res=>{
              if (res.status == "200") {
                var user = this.user;
                user.imgList = res.data.data;
                user.nickName = this.CompleteForm.nickName;
                user.email = this.CompleteForm.email;
                request.post('/api/user/updateUser', user).then(res => {
                  this.CompleteDialogVisible = false;
                })
              }
            })
      }
    },

    handleRemove(file, fileList) {
      this.fileList = fileList
    },
    handleChange(file, fileList) {
      this.fileList = fileList
    },

    //身份证校验,测试组人员对添加表单中的身份信息提出了需求，在填写身份证信息时，
    //希望能对所填信息进行合法性校验。比如身份证的位数（目前二代身份证都是18位）、地区编号（所在省（市，旗，区）的行政区代码）、出生年月日（月份所对应的28天/29天/30天/31天）、顺序码（第十五到十七位，第十七位奇数是男性，偶数是女性）
    // 校验码（第十八位，如果尾号是10就用X代替了）



  }
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