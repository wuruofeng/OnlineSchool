<template>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 swiper-left">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"><img src="https://vue13.oss-cn-chengdu.aliyuncs.com/myfile/01-1.jpg"></div>
                        <div class="swiper-slide"><img src="https://vue13.oss-cn-chengdu.aliyuncs.com/myfile/01-2.jpg"></div>
                        <div class="swiper-slide"><img src="https://vue13.oss-cn-chengdu.aliyuncs.com/myfile/01-3.jpg"></div>
                        <div class="swiper-slide"><img src="https://vue13.oss-cn-chengdu.aliyuncs.com/myfile/01-4.jpg"></div>
                    </div>

                </div>
            </div>
            <div class="col-md-9">
                <div class="wrapper">
                    <div class="container">
                        <h1 style="font-weight: bold;font-size: 70px;color: #603d57">欢迎登录</h1>
                        <h1 style="font-weight: bold;font-size: 70px;color: #603d57;display:none" class="mobile_login">欢迎登录</h1>
                        <h1 style="font-size: 45px;color: #603d57">享受自己阅读的时光吧！</h1>

                        <form class="form" id="ex_form">
                            <ValidationProvider name="用户名" rules="required" v-slot="{ errors,classes}" >
                                <input type="text"  placeholder="用户名" v-model="account" style="font-weight: 400;width: 80%" :class="classes" >
<!--                                <span slot="test"><i class="fa fa-exclamation-circle" aria-hidden="true"></i></span>-->
                                <span style="color:red;font-size: 16px;line-height: 30px;padding: 0 0 0 24px;">{{ errors[0] }} </span>
                            </ValidationProvider>
                            <ValidationProvider name="密码" rules="required" v-slot="{ errors,classes}" >
                            <input type="password"  placeholder="密码" v-model="password" style="font-weight: 400;width: 80%" :class="classes">
                                <span style="color:red;font-size: 16px;line-height: 30px;padding: 0 0 0 24px;">{{ errors[0] }} </span>
                            </ValidationProvider><br/>

                            <button type="button" id="login-button" @click="login" v-loading.fullscreen.lock="fullscreenLoading">登录</button>

                        </form>
                        <router-link to="/join" id="register-button" style="font-size: 15px">成为会员</router-link>
                        <router-link to="/password/reset" id="forgot_pwd-button" style="margin-left: 20px;font-size: 15px">忘记密码</router-link>
                    </div>

                    <ul class="bg-bubbles">
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</template>

<script>
    // import axios from 'axios'
    // import Swiper from 'swiper';
    import  {setCookie,getCookie,delCookie} from  '@/util/cookie'

    $("#login-button").click(function(event){
        event.preventDefault();

        $('form').fadeOut(500);
        $('.wrapper').addClass('form-success');
    });
//表单验证(待写)


    export default {
        name: "login_components",
        mounted(){
            this.emitt();
            getCookie();
            new Swiper ('.swiper-container', {
                loop: true,
                slidesPerView: 'auto',
                speed:1000,
                effect:'fade',
                autoplay:true
            })
        },
        data(){
            return {
                isLoging: false,
                account: '',
                password: '',
                repeatpassword:'',
                email:'',
                sex:'',
                flag:0,
                fullscreenLoading: false



            }

        },
        computed:{

        },
        methods:{
            emitt(){
                this.$emit("dialogVisibleEvent", false);
            },
            //登录逻辑
            login(){
                this.fullscreenLoading = true;
                setTimeout(() => {
                    this.fullscreenLoading = false;
                }, 1000);

                // if(this.account!='879932318@qq.com'){
                //     this.$message({
                //         showClose: true,
                //         message: '错了哦，账户信息填写错误!',
                //         type: 'error'
                //     });
                //     return
                // }
                // if(this.account!='' && this.password!=''){
                //     this.$message({
                //         showClose: true,
                //         message: '恭喜你，表单填写没问题',
                //         type: 'success'
                //     });
                //
                // }
                this.toLogin();
            },
            //登录请求
            toLogin(){
                const self = this
                // let loginParam = {
                //     userName: this.account,
                //     // userid: this.account,
                //     passWord: this.password
                // }
                //console.log('12321321:'+loginParam.userid)
                //设置在登录状态
                this.isLoging = true;
                //axios
                axios.post('http://106.54.23.221:8080/users/login',{
                    userName: this.account,
                    // userid: this.account,
                    passWord: this.password
                }).then( (res) => {
                    console.log(res);
                    if (res.data.code === 1) {
                        let expireDays = 1000 * 60 * 60 * 24 * 15;
                        //
                        //登录成功后
                        console.log("登录成功！")

                        let username = res.data.data.user.userName
                        let totally_watching_num = res.data.data.user.totally_watching_num
                        let totally_watching_times = res.data.data.user.totally_watching_times
                        let exp =  res.data.data.user.exp
                        let avatar = res.data.data.user.avatar
                        let userid = res.data.data.user.id
                        let isLogin = true
                        let avatar_code = decodeURIComponent(avatar)
                        // this.$store.state.username = this.$store.dispatch('updateUserInfo',obj)
                        this.$store.commit('SET_USERNAME',username)
                        this.$store.commit('SET_TOTALLY_WATCHING_NUM',totally_watching_num)
                        this.$store.commit('SET_TOTALLY_WATCHING_TIME',totally_watching_times)
                        this.$store.commit('SET_EXP',exp)
                        this.$store.commit('SET_LOGIN',isLogin)
                        this.$store.commit('SET_ID',userid)
                        // console.log(this.$store.state)
                        setCookie('username', username, expireDays);
                        setCookie('totally_watching_num', totally_watching_num, expireDays);
                        setCookie('totally_watching_times', totally_watching_times, expireDays);
                        setCookie('exp', exp, expireDays);
                        setCookie('isLogin', isLogin, expireDays);
                        setCookie('avatar', avatar, expireDays);
                        setCookie('userid', userid, expireDays);
                        //第二次



                        // self.$router.push({path: '/'})
                        window.location.assign('/')
                    } else {
                        console.log(res);
                        this.$message({
                            showClose: true,
                            message: '用户名或密码填写错误！',
                            type: 'error',
                            duration:2001,
                        });

                    }
                    }

                )
                    .catch(function (error) {
                        console.log(error)
                    })


                //演示用
                // setTimeout(()=>{
                //     //登录状态15天后过期
                //     let expireDays = 1000 * 60 * 60 * 24 * 15;
                //     this.setCookie('session','blablablablabla...', expireDays);
                //     this.isLoging = false;
                //     //登录成功后
                //     this.$router.push('/user_info/');
                // },3000)
            },

            //注册请求
            toRegesiter(){
                const self = this
                //一般要跟后端了解密码的加密规则
                //这里例子用的哈希算法来自./js/sha1.min.js
                // let password_sha = hex_sha1(hex_sha1( this.password ));

                //需要想后端发送的登录参数
                let loginParam = {
                    username: this.account,
                    password: this.password,
                    email: this.email,
                    sex:this.sex,
                }

                //设置在登录状态
                this.isLoging = true;

                //axios
                axios.get('/registerapi',{params:loginParam}).then((res) => {
                    if(res.data === "add success"){
                        // let expireDays = 1000 * 60 * 60 * 24 * 15;
                        // this.setCookie('session', response.data.session, expireDays);
                        //登录成功后
                        console.log("注册成功！")
                        //?
                        self.$router.push({path:'/'})
                    }else{
                        console.log(res);
                        console.log("注册失败！")
                    }
                })
                    .then((error) => {
                        console.log(error)
                    })



            }



        },

    }


</script>

<style scoped lang="less">
@import "css/login";
#login-button{
    width: 80%;
    margin-top: 40px;
}
#register-button{
    width: 120px;
    margin-left: 20px;
}
.swiper-left{
    margin-top: 100px;
}

.swiper-container {
    width: 100%;
    height: 798px;

}

/*@media screen and (min-width:600px) {*/
/*    .swiper-container {*/
/*        display: none;*/

/*    }*/

/*}*/
@media screen and (max-width:768px) {
    .swiper-container {
       display: none;
    }
    h1{
        font-size: 30px!important;
        //display: none;
    }
    .mobile_login{
        display: inline;
    }
    .wrapper{
        margin-top: 0px;
    }

}
    .form{
        margin-top: 20px;
    }
    #login-button{
        font-weight: 400;
    }
    input.valid{

    }
    input.invalid{
        border: solid 1px #ff5b5b;
    }


</style>
