import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate"

Vue.use(Vuex)

//相当于全局的变量
export default new Vuex.Store({
    //存储属性
    state: {
        user: {
            id: "",
            userName: "",
            password: "",
            adress: "",
            age: "",
            sex: "",
            tag: "",
            isLogin: false,
        },
        admin: {
            adminIsLogin: false,
            name: "",
            pwd: "",
            phone: "",
        }
    },
    //存储计算属性
    getters: {},
    //直接操作数据
    mutations: {
        setUser(state, user) {
            let loginUser = user
            state.user = loginUser
            user.isLogin = true;
        },
        setAdmin(state, adminUser) {
            state.admin = adminUser;
            state.admin.adminIsLogin = true;
        },
        quitUserLogin(state) {
            state.user = {}
        },
        quitAdminLogin(state) {
            state.admin = {}
        }
    },
    //调用mutation里的方法，方便先完成一部分逻辑
    actions: {
        setUser(context, user) {
            context.commit('setUser', user);
        },
        setAdmin(context, adminUser) {
            context.commit('setAdmin', adminUser);
        },
        quitLogin(context, isUser) {
            if (isUser == "user") {
                console.log("haha")
                context.commit('quitUserLogin');
            } else {
                context.commit('quitAdminLogin');
            }
        },
    },

    //vuex持久化插件配置,每次更新vuex中的数据都会更新localStorage
    plugins: [
        createPersistedState({
            // storage:存储位置，localStorage或sessionStorage或cookie
            // cookie 存储方式有区别，下面单独讲
            // 默认存储在localStorage中
            storage: window.localStorage,
            // 存储的 key 值，默认是vuex
            key: 'vueX',
            // 要存储的数据,render函数的参数是state对象
            render(state) {
                return {...state}
                // 我这里直接把state中的全部数据解构存进去，
                // 也可以只存需要的数据，以key:value的形式
                // 如下
                // return {userName:state.userName}
            }
        })
    ]
})
