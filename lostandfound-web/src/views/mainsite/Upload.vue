<template>
    <!--    find就是失物招领，lost就是寻物启事-->
    <div id="body">
        <div id="radio">
            <el-radio v-model="lostOrFind" :label=true>失物招领</el-radio>
            <el-radio v-model="lostOrFind" :label=false>寻物启事</el-radio>
        </div>
        <hr>
        <div id="upload">
            <span>{{lostOrFind ? "失物招领 : " : "寻物启事: " }}</span>
            <el-form ref="form" :model="form" label-width="120px">
                <el-form-item label="标题：">
                    <el-input v-model="form.title"></el-input>
                </el-form-item>

                <el-form-item :label="lostOrFind ? '发现区域：' : '丢失区域：'">
                    <el-input v-model="form.area"></el-input>
                </el-form-item>

                <el-form-item :label="lostOrFind ? '发现时间：' : '丢失时间：'">
                    <el-date-picker
                        v-model="form.date"
                        type="date"
                        placeholder="选择日期：">
                    </el-date-picker>
                </el-form-item>

                <el-form-item label="物品类别：">
                    <el-checkbox-group v-model="form.selectedType">
                        <el-checkbox v-for="item in type" :label="item" :key="item">{{ item }}</el-checkbox>
                    </el-checkbox-group>
                </el-form-item>

                <el-form-item label="物品详情描述：">
                    <el-input type="textarea" v-model="form.desc"></el-input>
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
                    <el-button type="primary" @click="submitUpload">立即发布</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>

</template>

<script>
export default {
    name: "upload",
    data() {
        return {
            //判断是lost or found
            lostOrFind: true,

            //类别
            type: ["食品", "电子产品", "生活用品", "手机", "卡", "现金"],

            //上传的照片集合
            fileList: [],

            //传递的信息
            form: {
                title: "",
                desc: '',
                area: '',
                date: '',
                selectedType: [],
                imgList: '',
            }
        }
    },
    methods: {
        //发布按钮的点击事件,上传图片
        submitUpload() {
            //判断是否有文件再上传
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
        //上传所有数据
        uploadData(imgsUrlList) {
            let tag = "", image = "";
            console.log("haha",imgsUrlList)
            console.log("haha",imgsUrlList.length)

            //将tag数组转换成字符串
            for (let i = 0; i < this.form.selectedType.length; i++) {
                tag += this.form.selectedType[i] + '&';
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
                        title: this.form.title,
                        description: this.form.desc,
                        lostArea: this.form.area + '&' + this.$store.state.user.location,
                        lostTime: this.form.date,
                        tag: tag,
                        image: image
                    }
                }).then(res => {
                    this.form = {};
                    this.$router.push({path: '/'})
                    // this.$message.success("恭喜您发布成功,祝您一切顺利")
                }).catch(err => {
                    this.$message.error("服务器错误，稍后再发布吧")
                })
            } else {
                this.$axios({
                    method: "post",
                    url: "/api/finds/add",
                    data: {
                        uid: this.$store.state.user.id,
                        title: this.form.title,
                        description: this.form.desc,
                        foundArea: this.form.area + '&' + this.$store.state.user.location,
                        foundTime: this.form.date,
                        tag: tag,
                        image: image
                    }
                }).then(res => {
                    this.form = {};
                    this.$router.push({path: '/'})
                    this.$message.success("恭喜您发布成功,祝您一切顺利")
                }).catch(err => {
                    this.$message.error("服务器错误，稍后再发布吧")
                })
            }
        },

        //上传组件的一些钩子
        handleRemove(file, fileList) {
            this.fileList = fileList
        },
        handleChange(file, fileList) {
            this.fileList = fileList
        },
        handlePreview(file) {
            console.log(file);
        },
    }
}
</script>

<style scoped lang="less">
#body {
    padding: 60px 130px;

    #radio {
        zoom: 130%;
    }

    hr {
        margin: 30px -100px;
        background-color: #9B9B9B;
    }

    #upload {
        span {
            margin-bottom: 10px;
            display: inline-block;
            font-size: 24px;
            color: #1092ed;
        }

        .el-form {
            padding: 20px 50px;
            width: 60%;
        }
    }
}
</style>