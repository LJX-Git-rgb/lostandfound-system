import Vue from 'vue'
import VueRouter from 'vue-router'
import UserInfo from '../views/UserInfo.vue'
import MainSite from '../views/MainSite.vue'
import login from '../views/login.vue'



Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'login',
    component: login,
  },
  {
    path: '/mainSite',
    name: 'MainSite',
    component: MainSite,
    children:[
      {
        path: 'allUser',
        name: 'UserInfo',
        component: UserInfo
      }
    ]
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
