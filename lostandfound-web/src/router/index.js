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
import FindGoods from '../views/mainsite/FindGoods.vue'
import LostGoods from "@/views/mainsite/LostGoods";
import LostGoodsInfo from '../views/mainsite/LostGoodsInfo.vue';
import FindGoodsInfo from '../views/mainsite/FindGoodsInfo.vue';
import AdminLogin from '../views/login/AdminLogin.vue';
import Upload from "../views/mainsite/Upload";
import MyPost from "../views/mainsite/MyPost";
import Help from "@/views/mainsite/Help";
Vue.use(VueRouter)

const routes = [
// mainsite路由
    {
        // 默认网站 就是 Mainsite - MainsiteBody
        path: '/',
        name: 'mainSite',
        component: MainSite,
        children: [

            {
                path: '/',
                component: MainSiteBody
            },

            // /accountInfo 个人信息部分
            {
                path: 'accountInfo',
                name: 'accountInfo',
                component: AccountInfo
            },
            // /find or lost goods 失物招领/寻物启事部分
            {
                path: 'findgoods',
                component: FindGoods,
            },
            {
                path: 'lostgoods',
                component: LostGoods,
            },

            // /upload 我要发布部分
            {
                path: 'upload',
                component: Upload,
            },

            // /find or lost good?id= * 每个失物招领/寻物启事对详细信息 id为编号
            {
                path: 'lostgood/',
                component: LostGoodsInfo,
            },

            {
                path: 'findgood/:id',
                component: FindGoodsInfo
            },

            // /mypost 我的发布部分
            {
                path: 'mypost',
                component: MyPost
            },
            {
                path: 'help',
                component: Help
            }
        ]
    },

//  login路由
    {
        path: '/login',
        name: 'login',
        component: Login,
        children: [
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
        children: [
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
