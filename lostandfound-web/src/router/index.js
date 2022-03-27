import Vue from 'vue'
import VueRouter from 'vue-router'

import AllUser from '../views/adminsite/UserInfo.vue'
import MainSite from '../views/mainsite/MainSite.vue'
import AdminSite from "../views/adminsite/AdminSite.vue";
import MainSiteBody from '../views/mainsite/MainSiteBody.vue'
import Login from '../views/login/Login.vue'
import NormalLogin from '../views/login/NormalLogin.vue'
import WechatLogin from '../views/login/wechatLogin.vue'
import AccountInfo from '../views/mainsite/PersonInfo.vue'
import LostGoodsInfo from '../views/mainsite/LostGoodsInfo.vue';
import FindGoodsInfo from '../views/mainsite/FindGoodsInfo.vue';
import FindGoods from '../views/mainsite/FindGoods.vue'
import AdminLogin from '../views/login/AdminLogin.vue';

Vue.use(VueRouter)

const routes = [
// mainsite路由
  {
	path: '/',
	name: 'mainSite',
	component: MainSite,
	children:[
      
		{
			path: '/',
			component: MainSiteBody
		},

		{
			path: 'accountInfo',
			name: 'accountInfo',
			component:AccountInfo
		},
		{
			path: 'findgoods',
			component: FindGoods,
		},
		{
			path: 'upload',
			component: FindGoods,
		},
		{
		path:'lostgood/:id',
			component: LostGoodsInfo,
		},

		{
		path:'findgood/:id',
			component: FindGoodsInfo
		}
    ]
  },
  
//  login路由
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
  
//   admin路由
  {
    path: '/admin',
    name: 'adminSite',
    component: AdminSite,
    children:[
		{
			path: 'login',
			name: 'login',
			component: AdminLogin
		},
		{
			path: 'allUser',
			component: AllUser
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
