import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        user: {},
        location:'',
    },
    mutations: {
        setUser(state, user) {
            state.user = user
        },
        setLocation(state, location) {
            state.location = location
        },
    },
    actions: {
        setUser(context, user) {
            context.commit('setUser', user);
        },
        setLocation(context, location) {
            context.commit('setLocation', location);
        },
    },
    
})
