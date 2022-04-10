<template>
  <div id="content">
      <div id="title" >
          <a1 class="el-icon-back" @click="$router.push({path:'/login'})"> 首页 </a1>
          <a2>帮助页面</a2>
      </div>
      <div id="question-list">
          <el-collapse v-model="activeNames" accordion>
              <el-collapse-item title="基本操作问题" name="1">
                <div>没有账号，先进行注册，输入邮箱，密码，校对验证码即可注册成功</div>
                <div>若已经注册过，用户可采用账号密码直接登陆</div>
              </el-collapse-item>
              <el-collapse-item title="使用问题" name="2">
                <div>登录页面：通过登录界面用户可采用账号登录</div>
                <div>首页：登录后进入首页，页面展示有最近失物以及拾物的发布信息，点击对应物品可进行查看</div>
              </el-collapse-item>
              <el-collapse-item title="用户操作问题" name="3">
                <div>发布物品信息：根据输入框提示添加信息，点击发布即可</div>
                <div>认领物品：点击对应物品，点击认领，留下个人的联系方式</div>
                <div>个人中心：用户可以修改头像，个人信息等</div>
              </el-collapse-item>
              <el-collapse-item title="可控 Controllability" name="4">
                <div>用户决策：根据场景可给予用户操作建议或安全提示，但不能代替用户进行决策；</div>
                <div>结果可控：用户可以自由的进行操作，包括撤销、回退和终止当前操作等。</div>
              </el-collapse-item>
          </el-collapse>
      </div>
      <div id="fk-titile">给我们反馈：</div>
      <div id="fk">
          <el-form :inline="true">
              <div id="input">
                  <el-input
                            type="textarea"
                            :rows="2"
                            placeholder="请输入问题"
                            v-model="textarea"
                            style="width: 500px"></el-input>
                  <a>
                      <el-button
                          type="primary"
                          @click="foundPwd"
                          style="height: 35px">提 交</el-button>
                  </a>
              </div>
          </el-form>
      </div>
  </div>
</template>

<script>
export default {
  name:'HelpPage',
  data() {
    return {
        textarea: '',
      activeNames: ['1']
    };
  },
  methods: {
    handleChange(val) {
      console.log(val);
    }
  }
}
</script>

<style lang="less" scoped>
    #content{
        padding: 100px 300px;
        #title{
            width: 500px;
            height: 65px;
            a1{
                cursor: pointer;
            }
            a2{
                padding: 30px;
                margin-left: 300px;
            }
        }
        #question-list{
            width: 800px;
            height: 300px;
        }
        #fk-titile{
            width: 300px;
            height: 40px;
        }
        #fk{
            width: 800px;
            margin-left: 65px;
            input {
                width: 300px;
            }
            a{
                margin-left: 30px;
            }
        }
    }
</style>