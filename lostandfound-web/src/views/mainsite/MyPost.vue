<template>
    <div id="timeBlock">
        <span v-if="lostOrFind">我发布的寻物启事 :
            <el-popover
                placement="top"
                width="160"
                v-model="visible">
                <p>确定要删除所有发布记录吗？</p>
                <div style="text-align: right; margin: 0">
                    <el-button size="mini" type="text" @click="visible = false">取消</el-button>
                    <el-button type="primary" size="mini" @click="deleteAll">确定</el-button>
                </div>
                <el-button slot="reference">删除</el-button>
            </el-popover>
<!--            <el-button icon="el-icon-delete" @click="deleteAll"></el-button>-->
        </span>
        <span v-if="!lostOrFind">我发布的失物招领 :
            <el-popover
                placement="top"
                width="160"
                v-model="visible">
                <p>确定要删除所有发布记录吗？</p>
                <div style="text-align: right; margin: 0">
                    <el-button size="mini" type="text" @click="visible = false">取消</el-button>
                    <el-button type="primary" size="mini" @click="deleteAll">确定</el-button>
                </div>
                <el-button slot="reference">删除</el-button>
            </el-popover>
<!--            <el-button icon="el-icon-delete" @click="deleteAll"></el-button>-->
        </span>
        <el-timeline>
            <el-timeline-item v-for="item in tableData" :key="item.id" :timestamp="new Date(item.createTime).format('yyyy-MM-dd hh:mm:ss')" placement="top">
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
                <div class="d2">
                    <el-button class="btn1" type="danger" icon="el-icon-delete" circle @click="deleteById(item.id)"></el-button>
                </div>
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
                  visible:this.visible = true,
              }
          }).then(res =>{
              console.log(res)
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
              console.log(res)
          })
      }
    },
    mounted() {
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
        position: relative;
        right: 10px;
        top: 10px;
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