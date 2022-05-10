<template>
    <div id="timeBlock">
        <div style="display: flex;justify-content: space-between;width: 1000px;">
            <span v-if="lostOrFind">我发布的寻物启事 :</span>
            <span v-if="!lostOrFind">我发布的失物招领 :</span>
            <el-popover
                placement="top"
                width="160"
                v-model="visible">
                <p>确定要删除所有发布记录吗？</p>
                <div style="text-align: right; margin: 0">
                    <el-button size="mini" type="text" @click="visible = false">取消</el-button>
                    <el-button type="primary" size="mini" @click="deleteAll">确定</el-button>
                </div>
                <el-button slot="reference" icon="el-icon-delete">全部清空</el-button>
            </el-popover>
        </div>
        <el-timeline>
            <el-timeline-item v-for="item in tableData" :key="item.id" :timestamp="new Date(item.createTime).format('yyyy-MM-dd hh:mm:ss')" placement="top">
                <div class="d2">
                    <el-button class="btn2" type="primary" size="small" icon="el-icon-edit" circle @click="editUserContact">修改物品信息</el-button>
                    <el-button class="btn1" type="danger" icon="el-icon-delete" circle @click="deleteById(item.id)"></el-button>
                </div>
                <a @click="$router.push({path: 'goodsInfo', query:{state:$route.fullPath.split('?')[1], id:item.id}})">
                    <el-card >
                        <img :src="require('../../../../lostandfound-miniprogram/src/static/image' + item.imageList[0])" alt="" id="cardImg">
                        <div id="content">
                            <span>{{item.title}}</span>
                            <h3>{{item.description}}</h3>
                            <br>
                            <p>提交于 {{new Date(item.createTime).format("yyyy-MM-dd hh:mm:ss")}}</p>
                        </div>
                    </el-card>
                </a>
            </el-timeline-item>
        </el-timeline>
        <a id="archor">
            广告位招租
        </a>
<!--        修改物品信息弹出框-->
        <el-dialog :visible.sync="ContactDialogVisible" title="修改" width="60%">
            <el-form label-width="120px">
                <el-form-item label="标题：">
                    <el-input v-model="goods.title"></el-input>
                </el-form-item>
                <el-form-item :label="lostOrFind ? '发现区域：' : '丢失区域：'">
                    <el-input v-model="goods.area"></el-input>
                </el-form-item>
                <el-form-item :label="lostOrFind ? '发现时间：' : '丢失时间：'">
                    <el-date-picker
                        v-model="goods.date"
                        type="date"
                        placeholder="选择日期：">
                    </el-date-picker>
                </el-form-item>
                <el-form-item label="物品类别：">
                    <el-checkbox-group v-model="goods.selectedType">
                        <el-checkbox v-for="item in type" :label="item" :key="item">{{ item }}</el-checkbox>
                    </el-checkbox-group>
                </el-form-item>
                <el-form-item label="物品详情描述：">
                    <el-input type="textarea" v-model="goods.desc"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-upload
                        multiple
                        class="upload-demo"
                        ref="upload"
                        drag
                        action
                        :on-preview="handlePreview"
                        :on-change="handleChange"
                        :on-remove="handleRemove"
                        :file-list="fileList"
                        :auto-upload="false">
                        <i class="el-icon-upload"></i>
                        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
                        <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
                    </el-upload>
                </el-form-item>
                <el-form-item>
                      <span class="dialog-footer">
                        <el-button @click="ContactDialogVisible = false">取消</el-button>
                        <el-button type="primary" @click="ContactSave">确定</el-button>
                      </span>
                </el-form-item>
            </el-form>
        </el-dialog>
    </div>
</template>

<script>
export default {
    name: "MyPost",
    data() {
        return {
            lostOrFind: true,
            type: ["食品", "电子产品", "生活用品", "手机", "卡", "现金"],
            fileList: [],
            findData: [],
            lostData: [],
            visible: false,
            goodsInfo:{},
            goods:{
                title: "",
                desc: '',
                area: '',
                date: '',
                selectedType: [],
                imgList: '',
            },
            ContactDialogVisible:false,
        }
    },
    computed: {
        lostOrFind(){
            return this.$route.fullPath.split('?')[1] == 'lost'
        },
        tableData(){
            if (this.lostOrFind){
                return this.lostData;
            }else{
                return this.findData;
            }
        },
    },
    methods:{
      deleteAll(){
          this.$axios({
              url: '/api/generalgoods/deleteall',
              method:'get',
              params:{
                  uid:this.$store.state.user.id,
                  flag: this.lostOrFind,
              }
          }).then(res =>{
              this.load();
              this.visible = false;
          })
      },
      deleteById(id){
          this.$axios({
              url: '/api/generalgoods/deletebyid',
              method:'get',
              params:{
                  id:id,
                  flag: this.lostOrFind,
              }
          }).then(res =>{
              this.load();
          })
      },
        load(){
            this.$axios({
                method:"get",
                url:"/api/finds/byUser",
                params:{
                    uid:this.$store.state.user.id
                }
            }).then(res => {
                this.findData = res.data;
            })
            this.$axios({
                method:"get",
                url:"/api/losts/byUser",
                params:{
                    uid:this.$store.state.user.id
                }
            }).then(res => {
                this.lostData = res.data;
            })
        },
        editUserContact(){
            this.ContactDialogVisible=true
            this.goods={}
        },

        ContactSave(){
            if (this.fileList.length === 0) {
                //没有的话直接上传信息，不上传图片
                this.uploadData(null)
            }else {
                // 下面的代码将创建一个空的FormData对象:
                var formData = new FormData()
                // 你可以使用FormData.append来添加键/值对到表单里面；
                this.fileList.forEach((file) => {
                    formData.append('file', file.raw)
                })
                var url = this.lostOrFind ? "/api/finds/addImg" : "/api/losts/addImg"
                this.$axios
                    .post(url, formData)
                    //判断上传是否成功，成功返回一个img的地址然后请求后台添加其他数据
                    .then(res=>{
                        if (res.status == "200") {
                            this.uploadData(res.data.data);
                        }
                    })
            }
        },
        uploadData(imgsUrlList) {
            let tag = "", image = "";
            console.log("haha",imgsUrlList)
            console.log("haha",imgsUrlList.length)

            //将tag数组转换成字符串
            for (let i = 0; i < this.goods.selectedType.length; i++) {
                tag += this.goods.selectedType[i] + '&';
            }
            //判断imgs是否存在,也就是是否上传了图片,存在就将url数组转换成字符串
            if (imgsUrlList.length > 0) {
                for (let i = 0; i < imgsUrlList.length; i++) {
                    image += imgsUrlList[i] + '&';
                }
            }

            //给后端数据
            if (!this.lostOrFind) {
                this.$axios({
                    method: "post",
                    url: "/api/losts/add",
                    data: {
                        uid: this.$store.state.user.id,
                        title: this.goods.title,
                        description: this.goods.desc,
                        lostArea: this.goods.area + '&' + this.$store.state.user.location,
                        lostTime: this.goods.date,
                        tag: tag,
                        image: image
                    }
                }).then(res => {
                    this.goods = {};
                    this.$router.push({path: '/'})
                    this.$message.success("恭喜您修改成功,祝您一切顺利")
                }).catch(err => {
                    this.$message.error("服务器错误，稍后再修改吧")
                })
            } else {
                this.$axios({
                    method: "post",
                    url: "/api/finds/add",
                    data: {
                        uid: this.$store.state.user.id,
                        title: this.goods.title,
                        description: this.goods.desc,
                        foundArea: this.goods.area + '&' + this.$store.state.user.location,
                        foundTime: this.goods.date,
                        tag: tag,
                        image: image
                    }
                }).then(res => {
                    this.goods = {};
                    this.$router.push({path: '/'})
                    this.$message.success("恭喜您修改成功,祝您一切顺利")
                }).catch(err => {
                    this.$message.error("服务器错误，稍后再修改吧")
                })
            }
        },

        handleRemove(file, fileList) {
            this.fileList = fileList
        },
        handleChange(file, fileList) {
            this.fileList = fileList
        },
        handlePreview(file) {
            console.log(file);
        },
    },

    mounted() {
        this.load();
    }
}
</script>

<style lang="less" scoped>
#timeBlock {
    padding: 30px 250px 0px 130px;

    span {
        font-size: 24px;
        margin-bottom: 30px;
        display: inline-block;
        color: #1092ed;
    }

    /deep/ .el-timeline {
        padding-left: 50px;
        padding-right: 230px;
    }

    /deep/ .el-card__body {
        display: flex;
        border: 1px solid;

    }
    .d2 {
        min-width: 100%;
        height: 40px;
        position: relative;
        display:flex;
        justify-content:flex-end;
    }
    .btn1 {
        border: none;
        border-radius: 0;
        border-top-right-radius: 4px;
        position: relative;
        top: 41px;
    }
    .btn2{
        border: none;
        border-radius: 0;
        border-top-right-radius: 4px;
        position: relative;
        top: 41px;
    }
    #cardImg {
        width: 20%;
        height: 20%;
    }

    #archor {
        display: block;
        width: 230px;
        height: 400px;
        background-color: red;
        position: fixed;
        top: 35%;
        right: 9%;
    }

    #content {
        text-align: center;
        margin-left: 15px;
    }

    #delete {
        position: relative;
        float: right;
        top: -120px;
        font-size: 14px;
        display: inline-block;
    }
}
</style>