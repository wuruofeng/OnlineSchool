<template>
    <div class="hello">

        <!--    banner-->
        <div class="el-container_thispage">
            <banner></banner>
        </div>
<!--              UpdataRecently-->
        <UpdataRecently></UpdataRecently>
        <!--      Java修炼-->
        <JavaSection :wynews="wynews" :total="newsTotal"></JavaSection>
<!--        Swift-->
        <SwiftSection :wynews="wynews" :total="newsTotal"></SwiftSection>
<!--        Python-->
        <PythonSection :wynews="wynews" :total="newsTotal"></PythonSection>
<!--        加入我们组件-->
        <JoinUsComponent v-if="isLogin === 'false'"></JoinUsComponent>

        <!--    Footer-->

        <!--    回到顶部按钮-->
        <div class="goTop" id="js-go_top"><img src="@/assets/icon/icon_top.png" alt="回到顶部图片"></div>
    </div>
</template>

<script>
    import banner from "@/components/swiperbanner/banner";
    import UpdataRecently from "@/components/UpdateRecently/UpdataRecently";
    import JavaSection from "@/components/JavaSection/JavaSection";
    import SwiftSection from "@/components/SwiftSection/SwiftSection";
    import PythonSection from "@/components/PythonSection/PythonSection";
    import JoinUsComponent from "@/components/joinus/JoinUsComponent";
    //置顶按钮
    import "@/style/js/GoToTop"
    import {getCookie} from "../util/cookie";

    export default {
        name: 'HelloWorld',
        data() {
            return {
                wynews: [],
                newsTotal:0,
                isLogin:'false',
            }
        },
        components: {
            banner,
            UpdataRecently,
            JavaSection,
            SwiftSection,
            PythonSection,
            JoinUsComponent,//注册组件，这样才能用



        },
        mounted() {
            var isLogin = getCookie('isLogin')
            if(isLogin === null){
                this.isLogin = 'false'
            }else{
                this.isLogin = isLogin
            }
            console.log(this.isLogin)

            $('#js-go_top').gotoTop({
                offset: 500, //距离顶部的位置
                speed: 300, //移动到顶部的速度
                /*     iconSpeed : 300, //icon动画样式的速度*/
                animationShow: {
                    'transform': 'translate(0,0)',
                    'transition': 'transform .5s ease-in-out'
                }, //icon动画样式显示时
                animationHide: {
                    'transform': 'translate(80px,0)',
                    'transition': 'transform .5s ease-in-out'
                } //icon动画样式隐藏时
            });

            this.$axios.get('http://106.54.23.221:8080/course/hot/')
                .then(
                    res => {
                        //console.log(res)
                        this.wynews = res.data.data
                        this.newsTotal = 6
                        //console.log(this.newsTotal)
                        console.log(this.wynews)
                        //console.log(this.newsTotal)
                    })
                .catch(
                    err => {
                        console.log(err)
                    }
                )
        },
        methods:{
            /**
             * @return {string}
             */
            GetCourseOrChapterURL: function (courseName, chapterID) {
                if (courseName !== '' && chapterID !== '') {
                    var URL = '/course/' + courseName + '/episode/' + chapterID;
                    return URL;
                }
                if (chapterID === ''){
                    var URL = '/course/' + courseName;
                    return URL;
                }
            }
        }
    }

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>


    .el-container_thispage {
        margin-top: 100px;
        width: 100%;
        height: 800px;
    }

    .goTop > img {
        width: 50px;
        height: 50px;
        cursor: pointer;
    }

    .goTop {
        position: fixed;
        right: 20px;
        bottom: 20px;
    }
</style>
