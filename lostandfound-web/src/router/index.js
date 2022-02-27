import Vue from 'vue'
import VueRouter from 'vue-router'
import UserInfo from '../views/UserInfo.vue'
import MainSite from '../views/MainSite.vue'
import login from '../views/Login.vue'



Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'mainSite',
    component: MainSite,
    children:[
      {
        path: 'allUser', 
        name: 'UserInfo',
        component: UserInfo
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: login,
  },
  // {
  //   path: '/admin',
  //   name: 'admin',
  //   component: MainSite,
  //   children:[
  //     {
  //       path: 'allUser',
  //       name: 'UserInfo',
  //       component: UserInfo
  //     }
  //   ]
  // },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
