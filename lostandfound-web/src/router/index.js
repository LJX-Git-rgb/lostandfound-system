import Vue from 'vue'
import VueRouter from 'vue-router'
import UserInfo from '../views/adminsite/UserInfo.vue'
import MainSite from '../views/mainsite/MainSite.vue'
import AdminSite from "../views/adminsite/AdminSite.vue";
import MainSiteBody from '../views/mainsite/MainSiteBody.vue'
import Login from '../views/login/Login.vue'
import NormalLogin from '../views/login/NormalLogin.vue'
import WechatLogin from '../views/login/wechatLogin.vue'



Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'mainSite',
    component: MainSite,
    children:[
      // {
      //   path: 'accountInfo',
      //   name: 'accountInfo'
      // },
      {
        path: '/',
        component: MainSiteBody
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    children:[
      {
        path: '/',
        component: NormalLogin
      },
      {
        path: 'wechat',
        component: WechatLogin
      }
    ]
  },
  {
    path: '/admin',
    name: 'adminSite',
    component: AdminSite,
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
