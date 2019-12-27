<template>
    <div id="app">
        <top_nav v-show="top_navisshow"></top_nav>
        <router-view v-on:dialogVisibleEvent="showDialog" v-on:dialogVisibleEvent_="showDialog_"></router-view>
<!--        footer-->
        <footer-component v-show="isshow" ></footer-component>
    </div>
</template>

<script>
    import top_nav from "@/components/top_nav/top_nav";
    import footerComponent from "@/components/footer/footerComponent";
    import  {setCookie,getCookie,delCookie} from  '@/util/cookie'
    export default {
        name:'app',
        components:{
            top_nav,
            footerComponent
        },
        methods:{
            showDialog(visible){
                this.isshow = visible
            },
            showDialog_(visible){
                this.top_navisshow = visible
            },
            preIsLogin(){
                //打印Cookie
                console.log(document.cookie)
                // let username = getCookie('username')
                // let totally_watching_num = getCookie('totally_watching_num')
                // let totally_watching_times = getCookie('totally_watching_times')
                // let exp = getCookie('exp')
                // let isLogin = getCookie('isLogin')
                // //
                // if(isLogin){
                //     this.$store.commit('SET_USERNAME',username)
                //     this.$store.commit('SET_TOTALLY_WATCHING_NUM',totally_watching_num)
                //     this.$store.commit('SET_TOTALLY_WATCHING_TIME',totally_watching_times)
                //     this.$store.commit('SET_EXP',exp)
                //     this.$store.commit('SET_LOGIN',isLogin)
                //     console.log('登陆成功，store.state:',this.$store.state)
                //     console.log('seesion:isLogin:',getCookie('isLogin'))
                // }else{
                //     console.log('未检查到Cookie，请重新登录!store.state',this.$store.state)
                // }

            },
        },
        data(){
            return{
                isLogin: false,
                isshow:true,
                top_navisshow:true,
                userInfo: { //保存用户信息
                    nick: null,
                    ulevel: null,
                    uid: null,
                    portrait: null
                }
            }
        },
        mounted(){
            this.preIsLogin();
        },
    }
</script>

<style scoped>
    #app {
        color: black;
    }

</style>
