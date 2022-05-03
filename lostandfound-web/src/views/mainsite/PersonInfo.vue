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
                {{user.userRole == 1 ?'正常用户' : '被禁言用户'}}
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
                <el-image :src="require('../../../../lostandfound-miniprogram/src/static/image' + user.face)" style="height: 100px;"></el-image>
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
                    微博
                </template>
                {{ userContactInfo.microblogging }}
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
        <el-form :model="CompleteForm" label-width="120px">
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
                action="https://jsonplaceholder.typicode.com/posts/"
                :on-change="handleChange"
                :file-list="fileList">
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
          <el-form-item label="姓名">
            <el-input v-model="ApproveForm.name" style="width: 80%" />
          </el-form-item>
          <el-form-item label="身份证号" prop="inname">
            <el-input v-model="ApproveForm.idNumber" placeholder="请输入身份证号" maxlength="50" style="width: 80%"/>
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
          rules: {
            //身份证
            idNumber: [
              { required: true, message: "请输入身份证号", trigger: "blur" },
              { validator: this.idcard, trigger: "blur" },
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

    approveRole(){
      this.ApproveForm.uid = this.user.id;
        request.post("/api/approve",this.ApproveForm).then(res => {
          if(res.code === '200'){
            this.$message({
              type:"success",
              message:"认证成功"
            })

          }else {
            this.$message({
              type:"error",
              message:res.msg
            })
          }
          this.ApproveDialogVisible=false   //关闭弹窗
        })

    },

    CompletedUserInfo(){

    },

    handleChange(file, fileList) {
      this.fileList = fileList.slice(-3);
    },

    //身份证校验
    idcard(rule, value, callback) {
      if (!value) {
        if (rule.field == "idNumber") {
          return callback(new Error("身份证号码不能为空"));
        } else {
          return;
        }
      }
      //setTimeout(() => {
      let regIdCard = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
      //如果通过该验证，说明身份证格式正确，但准确性还需计算
      if (regIdCard.test(value)) {
        if (value.length == 18) {
          var idCardWi = new Array(
              7,
              9,
              10,
              5,
              8,
              4,
              2,
              1,
              6,
              3,
              7,
              9,
              10,
              5,
              8,
              4,
              2
          ); //将前17位加权因子保存在数组里
          var idCardY = new Array(1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2); //这是除以11后，可能产生的11位余数、验证码，也保存成数组
          var idCardWiSum = 0; //用来保存前17位各自乖以加权因子后的总和
          for (var i = 0; i < 17; i++) {
            idCardWiSum += value.substring(i, i + 1) * idCardWi[i];
          }
          var idCardMod = idCardWiSum % 11; //计算出校验码所在数组的位置
          var idCardLast = value.substring(17); //得到最后一位身份证号码
          //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
          if (idCardMod == 2) {
            if (idCardLast == "X" || idCardLast == "x") {
              callback();
            } else {
              callback(new Error("身份证号码错误"));
            }
          } else {
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if (idCardLast == idCardY[idCardMod]) {
              callback();
            } else {
              callback(new Error("身份证号码错误"));
            }
          }
        }
      } else {
        callback(new Error("身份证格式不正确"));
      }
      //}, 1000);
    },
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