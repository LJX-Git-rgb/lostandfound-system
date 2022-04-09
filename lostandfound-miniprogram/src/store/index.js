import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        userInfo: {},
    },
    mutations: {
        setUser(state, user) {
            let loginUser = user
            state.user = loginUser
            user.isLogin = true;
        },
    },
    actions: {
        setUser(context, user) {
            context.commit('setUser', user);
        },
    },
})
