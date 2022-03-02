import Vue from 'vue'
import VueRouter from 'vue-router'
import UserInfo from '../views/UserInfo.vue'
import MainSite from '../views/MainSite.vue'
import AdminSite from "../views/AdminSite.vue";
import Login from '../views/Login.vue'
import MainSiteBody from '../views/MainSiteBody.vue'


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
        path: '/mainSite',
        component: MainSiteBody
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
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
