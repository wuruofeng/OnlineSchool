// import Vue from 'vue'
// import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import HelloWorld from "@/components/HelloWorld";

// Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HelloWorld
  },
  {
    path:'/login',
    name:'login',
    component: () => import(/* webpackChunkName: "about" */ '@/components/userLogin/login_components.vue')
  },
  {
    path:'/join',
    name:'join',
    component: () => import(/* webpackChunkName: "about" */ '@/components/join/join.vue')
  },
  {
    path:'/video',
    name:'video',
    component: () => import(/* webpackChunkName: "about" */ '@/components/Video/VideoExample.vue')
  },
  {
    path:'/password/reset',
    name:'reset',
    component: () => import(/* webpackChunkName: "about" */ '@/components/userLogin/reset/resetpwd.vue')
  },
  {
    path:'/404',
    name: "notFound",
    component: () => import(/* webpackChunkName: "about" */ '@/components/Page404/pagenotfound.vue')
  },
  {
    path:'/series/:courseID/episode/:chapterID',
    name:'VideoPlayer',
    component: () => import(/* webpackChunkName: "about" */ '@/components/Video/VideoExample.vue')
  },
  {
    path:'/series/:courseID/ebook/:chapterID',
    name:'ebook',
    component: () => import(/* webpackChunkName: "about" */ '@/components/ebook/ebook.vue')
  },
  {
    path:'/series/:courseID',
    name:'course_mine',
    component: () => import(/* webpackChunkName: "about" */ '@/components/course_mine/course_mine.vue')
  },
  {
    path:'/register/:timeType',
    name:'register',
    component: () => import(/* webpackChunkName: "about" */ '@/components/userLogin/register/register.vue')
  },
  {
    path:'/more',
    name:'more',
    component: () => import(/* webpackChunkName: "about" */ '@/components/course/index.vue')
  },
  {
    path:'/personalspace',
    name:'personalspace',
    component: () => import(/* webpackChunkName: "about" */ '@/components/personalspace/personalspace.vue')
  },
  {
    path:'*',
    redirect:"/404",
  }
]

const routerPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return routerPush.call(this, location).catch(error=> error)
}

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
