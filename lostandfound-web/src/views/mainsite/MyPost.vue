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
    </div>
</template>

<script>
export default {
    name: "MyPost",
    data() {
        return {
            findData: [],
            lostData: [],
            visible: false,
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
                  visible:this.visible = true,
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
        }
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