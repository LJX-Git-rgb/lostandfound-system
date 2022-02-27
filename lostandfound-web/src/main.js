import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// element-ui
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/zh-CN'
import axios from 'axios'
Vue.prototype.$axios = axios

Vue.use(ElementUI, { locale })

Vue.config.productionTip = false
new Vue({
  router,
  store,
  render: h => h(App),
  axios
}).$mount('#app')
