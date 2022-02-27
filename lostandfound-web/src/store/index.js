import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogin:false,
    user:{
      id:"",
      userName:"",
      password:"",
      adress:"",
      age:"",
      sex:"",
      tag:"",
    }
  },
  getters:{

  },
  
  mutations: {
    setUser(state,user){
      state.user = user
    },
    setIsLogin(state,flag){
      state.isLogin = flag;
    }
  },
  actions: {
    setUser(context,user){
      context.commit('setUser',user);
    }
  },

  modules: {
  }
})
