<template>
    <div>
        <header class="header">
            <div class="container clearfix">
                <div class="fl left">
                    <a href="/" ><img src="https://vue13.oss-cn-chengdu.aliyuncs.com/myfile/logo.png" alt="" class="img1" /></a>
                    <a href="/" ><img src="https://vue13.oss-cn-chengdu.aliyuncs.com/myfile/logo-mini.png" alt="" class="img2" /></a>
                </div>
                <div class="right_box">
                    <div class="fr nav">
                        <ul class="navbar_nav" data-in="fadeInDown" data-out="fadeOutUp">
                            <li class="active mb-lg-5">
                                <a href="/#JavaSection">{{ $t('nav.java') }}</a>
                            </li>
                            <li class="dropdown mb-lg-5">
                                <a href="/#SwiftSection">
                                    {{ $t('nav.swift') }}<i class="el-icon-arrow-down"></i>
                                </a>
                                <div class="dropdown_menu">
                                    <a href="/series/1/episode/1">支持动画交互的 tab bar - IV</a>
                                    <a href="/series/1/episode/1">回顾基于多级容器的依赖关系</a>
                                    <a href="/series/1/episode/1">用户 session 的代码组织</a>
                                </div>
                            </li>
                            <li class="dropdown mb-lg-5">
                                <a href="/#PythonSection">{{ $t('nav.python') }}<i class="el-icon-arrow-down"></i></a>
                                <div class="dropdown_menu">
                                    <a href="/series/1/episode/1">支持动画交互的 tab bar - IV</a>
                                    <a href="/series/1/episode/1">回顾基于多级容器的依赖关系</a>
                                    <a href="/series/1/episode/1">用户 session 的代码组织</a>
                                </div>
                            </li>
                            <li class="mb-lg-5">
                                <router-link to="/more">{{ $t('nav.showmore') }}</router-link>
                            </li>
                            <li class="mb-lg-5">
                                <a href="javascript:void(0)">{{ $t('nav.aboutus') }}</a>
                            </li>
                            <li class="dropdown mb-lg-5">
                                <a>{{ $t('nav.lang') }}<i class="el-icon-arrow-down"></i></a>
                                <div class="dropdown_menu">
                                    <a @click="changecn()">中文</a>
                                    <a @click="changeen()">English</a>
                                    <a @click="changejp()"> Japanese</a>
                                </div>
                            </li>
                            <li class="mb-lg-6" v-if="isLogin === 'false' ">
                                <router-link to="/login">{{ $t('nav.login') }}</router-link>
                            </li>
                            <li class="mb-lg-6 dropdown" v-if="isLogin === 'true'" style="width: 200px" >
                                <a style="display: flex"><img :src="avatar" class="avatar"  ></img>{{username}}</a>

                                <div class="dropdown_menu">
                                    <router-link to="/personalspace"><i class="fa fa-user" style="margin-right: 20px"></i>{{ $t('nav.personspace') }}</router-link>
<!--                                    <a href="/" @click="exit()"><i class="fa fa-sign-out" style="margin-right: 20px"></i>{{ $t('nav.logout') }}</a>-->
                                    <router-link to="/" @click.native="exit()"><i class="fa fa-sign-out" style="margin-right: 20px"></i>{{ $t('nav.logout') }}</router-link>

                                </div>
                            </li>

                        </ul>
                    </div>
                        <a href="javascript:void(0)" id="navToggle" class="mb-lg-5">
                            <span></span>
                        </a>
                </div>


            </div>
        </header>
        <!--移动端的导航-->
        <div class="m_nav">
            <div class="top clearfix">
                <img src="@/assets/imgs/closed.png" alt="" class="closed"/>
            </div>
            <div class="logo">
                <img src="https://vue13.oss-cn-chengdu.aliyuncs.com/myfile/logo-mini.png" alt="" />
            </div>
            <ul class="ul" data-in="fadeInDown" data-out="fadeOutUp">
                <li class="active">
                    <a  href="/" class="close_toggle">{{ $t('nav.index') }}</a>
                </li>
                <li class="dropdown">
                    <a href="/#JavaSection">
                        {{ $t('nav.java') }}
                    </a>
                    <div class="dropdown_menu">
                        <a href="/series/1/episode/1" class="close_toggle">支持动画交互的 tab bar - IV</a>
                        <a href="/series/1/episode/1" class="close_toggle">回顾基于多级容器的依赖关系</a>
                        <a href="/series/1/episode/1" class="close_toggle">用户 session 的代码组织</a>
                    </div>
                </li>
                <li class="dropdown">
                    <a href="/#SwiftSection">{{ $t('nav.swift') }}</a>
                    <div class="dropdown_menu">
                        <a href="/series/1/episode/1" class="close_toggle">支持动画交互的 tab bar - IV</a>
                        <a href="/series/1/episode/1" class="close_toggle">回顾基于多级容器的依赖关系</a>
                        <a href="/series/1/episode/1" class="close_toggle">用户 session 的代码组织</a>
                    </div>
                </li>
                <li>
                    <a href="/#PythonSection" class="close_toggle">{{ $t('nav.python') }}</a>
                </li>
                <li>
                    <a class="close_toggle">{{ $t('nav.aboutus') }}</a>
                </li>
                <li>
                    <router-link to="/more" class="close_toggle">{{ $t('nav.showmore') }}</router-link>
                </li>
                <li v-if="isLogin === 'false'">
                    <router-link to="/login" class="close_toggle">{{ $t('nav.login') }}</router-link>
                </li>

                <li class="dropdown" v-if="isLogin === 'true'">
                    <a style="display: flex"><div class="avatar"></div>{{username}}</a>

                    <div class="dropdown_menu">
                        <a href="/personalspace" ><i class="fa fa-sign-out" style="margin-right: 20px"></i>{{ $t('nav.personspace') }}</a>
                        <a  @click="exit()"><i class="fa fa-user" style="margin-right: 20px"></i>{{ $t('nav.logout') }}</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
    import  {setCookie,getCookie,delCookie} from  '@/util/cookie'
    export default {
        name: "top_nav",
        mounted() {
            var isLogin = getCookie('isLogin')
            // this.username = this.$store.state.username
            var avatartemp = getCookie('avatar')
            // console.log(avatartemp)
            this.avatar = decodeURIComponent(avatartemp)
            this.username = getCookie('username')
            // this.avatar = getCookie('avatar')
            // console.log(this.avatar)
            if(isLogin === null){
                this.isLogin = 'false'
            }else{
                this.isLogin = isLogin
            }

        },
        data(){
          return{
              isLogin: 'false',
              username:'',
              lang:'',
              avatar:'https://vue13.oss-cn-chengdu.aliyuncs.com/user_avatar/default.png',

          }
        },
        methods:{
            exit(){
                delCookie('username')
                delCookie('totally_watching_num')
                delCookie('totally_watching_times')
                delCookie('exp')
                delCookie('isLogin')
                delCookie('avatar')
                delCookie('userID')


                console.log("Cookie 删除完成")
                window.location.assign('/')
            },
            changecn(){
                console.log("cn")
                this.$i18n.locale = 'cn'
            },
            changeen(){
                console.log("en")
                this.$i18n.locale = 'en'
            },
            changejp(){
                this.$i18n.locale = 'jp'
            }
        }
    }

    $(function(){
        //超过一定高度导航添加类名
        var nav=$("header"); //得到导航对象
        var win=$(window); //得到窗口对象
        var sc=$(document);//得到document文档对象。
        win.scroll(function(){
            if(sc.scrollTop()>=100){
                nav.addClass("on");
            }else{
                nav.removeClass("on");
            }
        })

        //移动端展开nav
        $('#navToggle').on('click',function(){
            $('.m_nav').addClass('open');
        })
        //关闭nav
        $('.m_nav .top .closed').on('click',function(){
            $('.m_nav').removeClass('open');
        })
        $('.close_toggle').on('click',function(){
            $('.m_nav').removeClass('open');
        })

        //二级导航  移动端
        $(".m_nav .ul li").click(function() {
            $(this).children("div.dropdown_menu").slideToggle('slow')
            $(this).siblings('li').children('.dropdown_menu').slideUp('slow');
        });

    })
</script>

<style scoped>
@import "css/head.css";
@import "css/reset.css";
/*@import "css/swiper.min.css";*/
/*@import "css/animate.css";*/
@import "../../assets/icon/xiangxia/iconfont.css";
.right_box {
    width: 100%;
}
.container{
    max-width: 100%;
    height: 100px;
}
    .avatar{
        width: 50px;
        height: 50px;
        border-radius: 50px;
        margin-top: 23px;
        margin-right:10px;
        background-size:cover
    }

</style>
