import Vue from 'vue'
import VueRouter from 'vue-router'

//admin
import AdminSite from "@/views/adminsite/AdminSite";
import AdminLogin from "@/views/login/AdminLogin";
import User from "@/views/adminsite/User";
import Goods from "@/views/adminsite/Goods";
import Notice from "@/views/adminsite/Notice";
import AdminRights from "@/views/adminsite/AdminRights";
import MyInfo from "@/views/adminsite/MyInfo";
import Feedback from "@/views/adminsite/Feedback";

//login
import Login from "@/views/login/Login";
import NormalLogin from "@/views/login/NormalLogin";
import WechatLogin from "@/views/login/WechatLogin";
import MainSiteBody from "@/views/mainsite/MainSiteBody";

//mainsite
import MainSite from "@/views/mainsite/MainSite";
import MyPost from "@/views/mainsite/MyPost";
import Help from "@/views/mainsite/Help";
import Upload from "@/views/mainsite/Upload";
import LostGoods from "@/views/mainsite/LostGoods";
import FindGoods from "@/views/mainsite/FindGoods";
import PersonInfo from "@/views/mainsite/PersonInfo";
import GoodsInfo from "@/views/mainsite/GoodsInfo";


Vue.use(VueRouter)

//去掉重复路由的警告
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
}

//定义路由
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
                component: PersonInfo
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
                path: 'goodsInfo',
                component: GoodsInfo,
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
                path: 'user',
                component: User
            },
            {
                path: 'goods',
                component: Goods,
            },
            {
                path: 'notice',
                component: Notice,
            },
            {
                path: 'rightsManege',
                component: AdminRights,
            },
            {
                path: 'myInfo',
                component: MyInfo
            },
            {
                path: 'feedback',
                component: Feedback
            },
        ]
    },
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router
