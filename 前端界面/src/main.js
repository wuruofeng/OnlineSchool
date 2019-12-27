// import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
// import ElementUI from 'element-ui'
// import 'element-ui/lib/theme-chalk/index.css'
import plLazy from "@/components/pl-lazy/pl-lazy.vue";
Vue.component('pl-lazy', plLazy);
import $ from 'jquery'
// import "bootstrap"
// import "bootstrap/dist/css/bootstrap.css"
// import Swiper from 'swiper'
// import "swiper/css/swiper.css"
// import  axios from 'axios'
//validate
import "@/util/validate/self_validate"
//Video
// import Video from 'video.js'
import 'video.js/dist/video-js.css'
// Vue.prototype.$video = Video

//i18n
// import VueI18n from 'vue-i18n'
// Vue.use(VueI18n)
const messages = {
  cn : {
    nav:{
      java:'Java修炼',
      swift:'Swift修炼',
      python:'Python修炼',
      showmore:'所有课程',
      aboutus:'关于我们',
      lang:'语言',
      login:'登录',
      index:'首页',
      logout:'退出登录',
      personspace:'个人空间',
    }
  },
  en : {
    nav:{
      java:'Java Cultivation',
      swift:'Swift Cultivation',
      python:'Python Cultivation',
      showmore:'ShowMore',
      aboutus:'About us',
      lang:'Language',
      login:'Login',
      index:'Home',
      logout:'Log out',
      personspace:'Space',
    }
  },
  jp : {
    nav:{
      java:'Javaプラクティス',
      swift:'Swiftの練習',
      python:'Pythonのプラクティス',
      showmore:'ショーモア',
      aboutus:'私達について',
      lang:'言語',
      login:'ログイン',
      index:'ホーム',
      logout:'ログアウト',
      personspace:'パーソナルスペース',
    }
  },
}
const i18n = new VueI18n({
  locale: 'cn',    // 语言标识
  //this.$i18n.locale //
  messages
})

//icon
import "@/assets/icon/xiangxia/iconfont.css"


//公用css
import "@/style/css/common.css"
//font-awsome
// import 'font-awesome/css/font-awesome.min.css'

//
// Vue.use(ElementUI)

Vue.prototype.$axios = axios

Vue.config.productionTip = false
/* eslint-disable */

new Vue({
  i18n,
  router,
  store,
  render: h => h(App),
  // watch:{
  //   "$route" : 'checkLogin'
  // },
  // created() {
  //   this.checkLogin();
  // },
  methods:{

  }
}).$mount('#app')
