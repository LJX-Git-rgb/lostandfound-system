<template>
    <div id="body">
        <div id="content">
            <div id="header">
                <h3>{{ goods.title }}</h3>
                <div id="buttons">
                    <el-button type="success" @click="changeGoodsState">
                        {{ this.$route.query.state == "find" ? "认领失物" : "我捡到了" }}
                    </el-button>
                    <el-button type="error" @click="report">举报</el-button>
                </div>
            </div>
            <hr>
            <div id="carousel-wrap">
                <el-carousel>
                    <el-carousel-item v-for="item in goods.imageList" :key="item">
                        <img :src="require('../../../../lostandfound-miniprogram/src/static/image' + item)" alt="">
                    </el-carousel-item>
                </el-carousel>
            </div>
            <div id="goodsInfo">
                <el-descriptions title="物品信息" v-if="this.$route.query.state=='find'">
                    <el-descriptions-item label="详情描述">{{ goods.description }}</el-descriptions-item>
                    <el-descriptions-item label="发现时间">{{ new Date(goods.foundTime).format("yyyy-MM-dd hh:mm:ss") }}
                    </el-descriptions-item>
                    <el-descriptions-item label="发现地点">{{ goods.foundArea.split('&').slice(0, 1).toString() }}
                    </el-descriptions-item>
                    <el-descriptions-item label="标签">
                        <el-tag size="small" v-for="tag in goodsTags" id="tag">{{ tag }}</el-tag>
                    </el-descriptions-item>
                    <el-descriptions-item label="记录创建时间">
                        {{ new Date(goods.createTime).format("yyyy-MM-dd hh:mm:ss") }}
                    </el-descriptions-item>
                </el-descriptions>
                <el-descriptions title="物品信息" v-if="this.$route.query.state=='lost'">
                    <el-descriptions-item label="详情描述">{{ goods.description }}</el-descriptions-item>
                    <el-descriptions-item label="发现时间">{{ new Date(goods.lostTime).format("yyyy-MM-dd hh:mm:ss") }}
                    </el-descriptions-item>
                    <el-descriptions-item label="发现地点">{{ goods.lostArea.split('&').slice(0, 1).toString() }}
                    </el-descriptions-item>
                    <el-descriptions-item label="标签">
                        <el-tag size="small" v-for="tag in goods.tag.split('&').slice(0,2)" id="tag">{{ tag }}</el-tag>
                    </el-descriptions-item>
                    <el-descriptions-item label="记录创建时间">
                        {{ new Date(goods.createTime).format("yyyy-MM-dd hh:mm:ss") }}
                    </el-descriptions-item>
                </el-descriptions>
            </div>
            <hr>
            <div id="userInfo" v-if="identifed">
                <el-descriptions title="个人信息">
                  <el-descriptions-item label="称呼">
                    {{ userContactInfo.appellation }}
                  </el-descriptions-item>

                  <el-descriptions-item label="手机号">
                    {{ userContactInfo.phone }}
                  </el-descriptions-item>

                  <el-descriptions-item label="QQ">
                    {{ userContactInfo.qq }}
                  </el-descriptions-item>

                  <el-descriptions-item label="邮箱">
                    {{ userContactInfo.email}}
                  </el-descriptions-item>

                  <el-descriptions-item label="微信号">
                    {{ userContactInfo.wechat }}
                  </el-descriptions-item>

                  <el-descriptions-item label="联系地址">
                    {{ userContactInfo.address }}
                  </el-descriptions-item>

                  <el-descriptions-item label="其他">
                    {{ userContactInfo.other }}
                  </el-descriptions-item>
                </el-descriptions>
            </div>
        </div>

<!--      举报信息弹窗-->
      <el-dialog :visible.sync="ReportDialogVisible" title="提示" width="30%">
        <el-form
            label-width="120px"
            ref="ReportForm"
            class="formDetails formDetailsNew">
          <el-form-item label="内容:">
            <el-input v-model="ReportForm.content" style="width: 80%" placeholder="请输入举报内容"/>
          </el-form-item>
        </el-form>
        <template #footer>
      <span class="dialog-footer">
        <el-button @click="ReportDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="ReportSave">确定</el-button>
      </span>
        </template>
      </el-dialog>

    </div>
</template>

<script>

Date.prototype.format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1,                 //月份
        "d+": this.getDate(),                    //日
        "h+": this.getHours(),                   //小时
        "m+": this.getMinutes(),                 //分
        "s+": this.getSeconds(),                 //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds()             //毫秒
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}

export default {
    data() {
        return {
            goods: {},
            otherGoodsList: [],
            identifed: false,
          ReportDialogVisible:false,
          ReportForm:{},
          userContactInfo:{}
        }
    },
    computed: {
        url() {
            return "api/" + this.$route.query.state + "s/findById"
        },
        goodsTags() {
            var split = this.goods.tag.split('&');
            return split.slice(0, split.length - 1);
        }
    },
    mounted() {
        this.$axios({
            url: this.url,
            method: "get",
            params: {
                id: this.$route.query.id
            }
        }).then(res => {
            this.goods = res.data;
        })
    },
    methods: {
        changeGoodsState() {
            this.$axios({
                url: '/api/generalgoods/changestate',
                method: "get",
                params: {
                  flag: this.$route.query.state == "find",
                  id:this.goods.id
                }
            }).then(res => {
                this.$message.success("恭喜您成功了，请看下方联系方式联系发表的人")
                this.identifed = true;
              this.$axios({
                url:'/api/user/searchUserContact',
                method:'GET',
                params:{
                  uid:this.$store.state.user.id
                }
              }).then( res => {
                console.log(res);
                this.userContactInfo = res.data.data[0];
              })
            })
        },

      //举报
      report(){
        this.ReportDialogVisible = true
        this.ReportForm = {}
      },

      ReportSave() {
            this.$axios({
                url: '/api/feedback/report',
                method: "get",
                params: {
                    isLost: this.$route.query.state == "lost",
                    content:this.ReportForm.content,
                    id:this.goods.id,
                    uid:this.$store.state.user.id,
                }
            }).then(res => {
              console.log(res);
                this.$message.success("恭喜您举报成功，管理员会认真审核的")
            })
        this.ReportDialogVisible = false
        }
    }
}
</script>

<style lang="less" scoped>
#body {
    #content {
        margin: 5%;
        margin-right: 30%;

        #header {
            margin-top: 3%;
            display: flex;
            justify-content: space-between;

            h3 {
                font-size: 25px;
            }

            #buttons {
            }
        }

        hr {
            margin-top: 2%;
        }

        #carousel-wrap {
            width: 50%;

            .el-carousel__item {
                img {
                    width: 100%;
                    height: 100%;
                }
            }
        }

        #goodsInfo,
        #userInfo {
            margin: 2%;

            #tag {
                margin-right: 5px;
            }
        }
    }
}
</style>