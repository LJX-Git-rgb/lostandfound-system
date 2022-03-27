import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user:{
      id:"",
      userName:"",
      password:"",
      adress:"",
      age:"",
      sex:"",
      tag:"",
      isLogin:false,
    },
    admin:{
      adminIsLogin: false
    }
  },
  getters:{
    adminIsLogin(state){
      return state.admin.adminIsLogin;
    }
  },
  mutations: {
    setUser(state,user){
      let loginUser = user
      state.user = loginUser
      user.isLogin = true;
    },
    setAdminLogin(state,flag){
      state.admin.adminIsLogin = flag;
    }
  },
  actions: {
    setUser(context,user){
      context.commit('setUser',user);
    },
    setAdminLogin(context,flag){
      context.commit('setAdminLogin',flag);
    },
    setUserLogin(context,flag){
      context.commit('setUserLogin',flag);
    }
  },
})
