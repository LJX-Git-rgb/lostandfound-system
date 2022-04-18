import Vue from 'vue'
import App from './App'
import store from './store'

Vue.config.productionTip = false

App.mpType = 'app'
Vue.prototype.$baseUrl="http://localhost:8082/"
const app = new Vue({
  ...App,
  store
})
app.$mount()
