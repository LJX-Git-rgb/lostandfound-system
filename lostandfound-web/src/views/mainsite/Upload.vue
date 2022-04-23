<template>
    <!--    lost就是失物招领，find就是寻物启事-->
    <div id="body">
        <div id="radio">
            <el-radio v-model="lostOrFind" :label=true>失物招领</el-radio>
            <el-radio v-model="lostOrFind" :label=false>寻物启事</el-radio>
        </div>
        <hr>
        <div id="findUpload" v-if="!lostOrFind">
            <span>寻物启事 : </span>
            <el-form ref="form" :model="form" label-width="120px">
                <el-form-item label="标题：">
                    <el-input v-model="form.title"></el-input>
                </el-form-item>

                <el-form-item label="丢失区域：">
                    <el-input v-model="form.area"></el-input>
                </el-form-item>

                <el-form-item label="丢失时间：">
                    <el-date-picker
                        v-model="form.date"
                        type="date"
                        placeholder="选择日期：">
                    </el-date-picker>
                </el-form-item>

                <el-form-item label="失物类别：">
                    <el-checkbox-group v-model="form.selectedType">
                        <el-checkbox v-for="item in type" :label="item" :key="item">{{ item }}</el-checkbox>
                    </el-checkbox-group>
                </el-form-item>

                <el-form-item label="失物详情描述：">
                    <el-input type="textarea" v-model="form.desc"></el-input>
                </el-form-item>

                <el-form-item>
                    <el-upload
                        class="upload-demo"
                        ref="upload"
                        drag
                        action="http://localhost:8081/losts/addImg"
                        multiple
                        :on-preview="handlePreview"
                        :on-remove="handleRemove"
                        :on-success="imgSuccess"
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

        <div id="lostUpload" v-if="lostOrFind">
            <span>失物招领 : </span>
            <el-form ref="form" :model="form" label-width="120px">
                <el-form-item label="标题：">
                    <el-input v-model="form.title"></el-input>
                </el-form-item>

                <el-form-item label="发现区域：">
                    <el-input v-model="form.area"></el-input>
                </el-form-item>

                <el-form-item label="发现时间：">
                    <el-date-picker
                        v-model="form.date"
                        type="date"
                        placeholder="选择日期：">
                    </el-date-picker>
                </el-form-item>

                <el-form-item label="拾物类别：">
                    <el-checkbox-group v-model="form.selectedType">
                        <el-checkbox v-for="item in type" :label="item" :key="item">{{ item }}</el-checkbox>
                    </el-checkbox-group>
                </el-form-item>

                <el-form-item label="物品详情描述：">
                    <el-input type="textarea" v-model="form.desc"></el-input>
                </el-form-item>

                <el-form-item>
                    <el-upload
                        class="upload-demo"
                        ref="upload"
                        drag
                        action="http://localhost:8081/finds/addImg"
                        multiple
                        :on-preview="handlePreview"
                        :on-remove="handleRemove"
                        :on-success="imgSuccess"
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
            lostOrFind: false,
            //类别
            type: ["食品", "电子产品", "生活用品", "手机", "卡", "现金"],

            form: {
                title: "",
                desc: '',
                area: '',
                date: '',
                selectedType: [],
                imgList: {},
            }
        }
    },
    methods: {
        //发布按钮的点击事件,上传图片
        submitUpload() {
            this.$refs.upload.submit();
        },
        //上传成功事件
        imgSuccess(res, file, fileList) {
            //判断上传是否成功，成功返回一个img的地址然后请求后台添加其他数据
            if (res.code == "200" || res.msg == "success") {
                let tag = "", image = "";
                for (let i = 0; i < this.form.selectedType.length; i++) {
                    tag += this.form.selectedType[i] + '&';
                }
                for (let i = 0; i < res.data.length; i++) {
                    image += res.data[i] + '&';
                }
                if (!this.lostOrFind){
                    this.$axios({
                        method: "post",
                        url:"/api/losts/add",
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
                        this.form={};
                        this.$router.push({path:'/'})
                    }).catch(err => {
                        this.$message.error("服务器错误，稍后再发布吧")
                    })
                }else{
                    this.$axios({
                        method: "post",
                        url:"/api/finds/add",
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
                        this.form={};
                        this.$router.push({path:'/'})
                    }).catch(err => {
                        this.$message.error("服务器错误，稍后再发布吧")
                    })
                }

            } else {
                this.$message.error(res.data.msg);
            }
        },

        //上传组件的一些其他事件
        handleRemove(file, fileList) {
            console.log(file, fileList);
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

    #findUpload,
    #lostUpload {
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