<template>
    <div style="margin-top: 100px">
        <section>
            <div class="g-bg-blue-lineargradient-v4-r">
                <div class="container u-bg-overlay__inner g-py-110">
                    <div class="row align-items-center">
                        <div class="col-md-8 g-mb-30">
                            <div class="g-width-100x">
                                <a class="u-tags-v1 g-color-white g-bg-blue g-py-4 g-px-10 mb-4">BEGINNER</a>
                            </div>
                            <h2 class="h1 g-color-white " style="font-weight: 300;margin-top: 20px">{{course_title}}</h2>
                            <h4 class="g-color-white g-font-weight-200 g-mb-50">{{course_short}}</h4>
                            <p class="lead g-color-blue-white-trans">{{description_full}}</p>
                            <hr>
                            <ul class="u-list-inline g-font-size-15  no-gutters" style="margin-top:35px">
                                <li class="col-md-auto col-12 list-inline-item g-mb-10" style="margin-top: 15px" >
                                    <router-link :to=stringcatvedioURL(this.wynews[0].term.id,this.courseID) class="g-width-100x text-center g-px-30 g-py-10 u-tags-v1 g-color-white g-bg-deeporange g-bg-orange--hover g-rounded-50">开始观看</router-link>
                                </li>
                                <li class="col-md-auto col-12 list-inline-item g-mb-10 " style="margin-top: 15px" v-if="isLogin==='false'">
                                    <router-link to="/login" class="text-center g-px-30 g-py-10 u-tags-v1 g-color-white g-bg-teal g-bg-aqua--hover g-rounded-50" >登录后管理视频并获取通知</router-link>
                                </li>
                                <li @click="srypopup()" class="col-md-auto col-12 list-inline-item g-mb-10" style="margin-top: 15px" v-if="isLogin==='true'">
                                    <router-link to="#" class="text-center g-px-30 g-py-10 u-tags-v1 g-color-white g-bg-teal g-bg-aqua--hover g-rounded-50" >收藏全部视频</router-link>
                                </li>
                                <li @click="srypopup()" class="col-md-auto col-12 list-inline-item g-mb-10" style="margin-top: 15px" v-if="isLogin==='true' && isUpdating===1">
                                    <router-link to="#" style="margin-top: 15px" class="text-center g-px-30 g-py-10 u-tags-v1 g-color-white g-bg-teal g-bg-aqua--hover g-rounded-50" >更新后通知我</router-link>
                                </li>
                            </ul>
                            <ul >

                            </ul>
                            <p class="g-color-blue-white-trans"><i>* Series still in development. Check back often for updates.</i></p>
                        </div>
                        <div class="col-md-4 g-mb-30">
                            <img :src=course_cover_url alt="Color basics" class="img-fluid rounded-circle  g-brd-around g-brd-5 g-brd-color-blue-trans">
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="g-bg-gray-light-v4 text-uppercase">
            <div class="container">
                <div class="row g-color-gray g-font-size-15 align-items-center">
                    <div class="col-md-auto g-py-15 g-brd-gray-light-v2 g-brd-right">
                        <a  class="g-color-gray-dark-v1 g-color-gray-dark-v4--hover">
                            <i class="fa fa-long-arrow-left"></i>返回所有系列</a></div>
                    <div class="col g-py-15 g-brd-gray-light-v2 g-brd-right">
                        <strong class="g-color-teal" style="font-size: 17px">Updated: 2019-12-03</strong>
                    </div>
                    <div class="col-md-auto g-py-12 g-brd-gray-light-v2 g-brd-right">
                        <i class="fa fa-youtube-play g-font-size-20"></i>
                        <span class="g-font-size-20 g-font-weight-600 g-color-gray-dark-v1">  {{newsTotal}}</span> VIDEOS
                    </div>
                </div>
            </div>
        </div>
        <section class="g-py-50">
            <div class="container">
                <div class="row">
                    <ul class="list-unstyled g-width-100vw g-mx-50--md g-mx-20">
                        <li v-for="(newsItem,index) of wynews" class="align-items-center d-flex g-brd-around g-brd-gray-light-v4 g-mb-minus-1 g-pa-20 justify-content-start" :class="{'episode-list-item':index%2===0}">
                            <div class="g-mt-2 g-pl-25 g-py-30 dismiss">
<!--                                 里层按钮-->
                                <div class="d-flex justify-content-center g-width-80 g-height-80 rounded-circle g-pa-20 g-bg-teal" v-if="(newsItem.userTerm === null) || (newsItem.userTerm.rate === 0) || (newsItem.userTerm.rate === -1) ">
                                    <div class="align-self-center">
                                        <div class="g-font-weight-600 g-color-white" style="font-size: 30px">{{index+1}}</div>
                                    </div>
                                </div>
<!--                                双选按钮底色-->
                                <div class="d-flex justify-content-center g-width-80 g-height-80 rounded-circle g-pa-20 g-bg-primary" v-if="!(newsItem.userTerm === null) && (newsItem.userTerm.rate > 0)">
                                    <div class="align-self-center">
                                        <div class="g-font-weight-600 g-color-white" style="font-size: 30px;">
                                            <i class="fa fa-check"></i>
                                        </div>
                                    </div>
                                </div>

                            </div>


                            <div class="g-pl-60--md h5 g-my-0">
                                <div class="text-uppercase">
                                    <strong class="m-0 g-color-gray">Episode&nbsp;&nbsp;{{index+1}}</strong>
                                    <span class="divider g-mx-6 g-color-gray">●</span>
                                    <strong class="g-color-teal">RUNTIME&nbsp;&nbsp;{{newsItem.term.duration}}</strong>
                                </div>
<!--                                双选标题-->
                                <h3 class="h2 g-font-weight-600 g-color-black g-mb-3">
                                    <a :href=stringcatvedioURL(newsItem.term.id,courseID)  class="g-mr-5 g-color-teal--hover align-items-center g-color-black" v-if="(newsItem.userTerm === null) || (newsItem.userTerm.rate === 0) || (newsItem.userTerm.rate === -1)">{{newsItem.term.title}}&nbsp;

                                    <span class="u-tags-v1 btn-xs tag-pos g-color-white g-bg-teal g-bg-cyan--hover g-rounded-50 g-py-4 g-px-15" v-if="course_isfree === 'true'">FREE</span></a>
                                </h3>
                                <h3 class="h2 g-font-weight-600  g-mb-3  text-line-through">
                                    <a :href=stringcatvedioURL(newsItem.term.id,courseID)  class="g-mr-5 g-color-teal--hover align-items-center text-muted1" v-if="!(newsItem.userTerm === null) && (newsItem.userTerm.rate > 0)">{{newsItem.term.title}}&nbsp;

                                        <span class="u-tags-v1 btn-xs tag-pos g-color-white g-bg-teal g-bg-cyan--hover g-rounded-50 g-py-4 g-px-15" v-if="course_isfree === 'true'">FREE</span></a>
                                </h3>



                                <ul class="u-list-inline h6 g-pt-15">
                                    <li class="list-inline-item g-mb-10 " v-if="isLogin === 'true' && ((newsItem.userTerm === null) || (newsItem.userTerm.rate === 0) || (newsItem.userTerm.rate === -1))">
                                        <a class="u-tags-v1 g-brd-around g-rounded-50 g-py-4 g-px-15 g-color-red g-brd-red g-bg-red-opacity-0_1 g-bg-red--hover g-color-white--hover ">
                                            <i class="fa fa-check"  @click="islike_updata($event)">标记看完</i>
                                        </a>
                                    </li>
<!--                                    双向-->
                                    <li class="list-inline-item g-mb-10" v-if="!(newsItem.userTerm === null) && (isLogin === 'true') && newsItem.userTerm.rate > 0">
                                        <a class="u-tags-v1 g-brd-around g-rounded-50 g-py-4 g-px-15 g-bg-red g-color-white   g-color-white--hover "  >
                                            <i class="fa fa-check" @click="islike_updata($event)">已看完</i>
                                        </a>
                                    </li>
                                    <li class="list-inline-item g-mb-10" v-if=" (isLogin === 'true') && (course_islike === false)" >
                                        <a class="u-tags-v1 g-brd-around g-rounded-50 g-py-4 g-px-15 g-color-red g-brd-red g-bg-red-opacity-0_1 g-bg-red--hover g-color-white--hover ">
                                            <i class="fa fa-heart" @click="rate_update($event)">收藏视频</i></a>
                                    </li>

<!--                                    双向-->
                                    <li class="list-inline-item g-mb-10" v-if=" (isLogin === 'true') && (course_islike === true)" >
                                        <a class="u-tags-v1 g-brd-around g-rounded-50 g-py-4 g-px-15 g-bg-red g-color-white g-bg-red--hover g-color-white--hover ">
                                            <i class="fa fa-heart" @click="rate_update($event)">取消收藏</i></a>
                                    </li>

                                    <li class="list-inline-item g-mb-10"><a :href=stringcatvedioURL(newsItem.term.id,courseID) class="u-tags-v1 g-color-teal g-brd-around g-brd-teal g-bg-teal-opacity-0_1 g-bg-teal--hover g-color-white--hover g-rounded-50 g-py-4 g-px-15"><i class="fa fa-youtube-play mr-1"></i>观看视频</a>
                                    </li>
                                    <li class="list-inline-item g-mb-10 g-mt-15"><a :href=stringcatebookURL(newsItem.term.id,courseID) class="u-tags-v1 g-color-teal g-brd-around g-brd-teal g-bg-teal-opacity-0_1 g-bg-teal--hover g-color-white--hover g-rounded-50 g-py-4 g-px-15"><i class="fa fa-book mr-1"></i>阅读文档</a>
                                    </li>
                                </ul>


                            </div>
                        </li>
                    </ul>
                    <p class="text-center g-width-100vw h5 g-color-gray"><i>* Series still in development. Check back often for updates.</i></p>
                </div>
            </div>
        </section>

    </div>
</template>

<script>
    import {getCookie} from "../../util/cookie";

    export default {
        name: "course_mine",
        data(){
            return{
                currentPage:1,
                wynews: [],
                newsTotal:0,
                isLogin:'false',
                courseID: this.$route.params.courseID,
                //course的内容
                course_title:'',
                course_id:'',
                course_short:'',
                description_full:'',
                isUpdating:0,
                course_cover_url:'',
                course_isfree:'false',
                video_isWatched:'false',
                userterm:[],
                course_islike:'false'

            }
        },
        computed:{

        },

        methods:{
            stringcatvedioURL:function(chapterID,courseID){
                return ('/series/'+courseID+'/episode/'+chapterID)
            },
            stringcatebookURL:function(chapterID,courseID){
                return ('/series/'+courseID+'/ebook/'+chapterID)
            },
            stringseriesURL:function(courseID){
                return ('/series/'+courseID)
            },
            srypopup(){
                this.$message.error('不好意思还没做好 -.-');
            },
            islike_updata(e){
                this.$message({
                    message: '操作成功!',
                    type: 'success'
                });

                if(e.target.innerText === "已看完"){
                    e.target.innerText = "标记看完"
                }else{
                    e.target.innerText = "已看完"
                }



            },
            rate_update(e){
                this.$message({
                    message: '操作成功!',
                    type: 'success'
                });
                if(e.target.innerText === "取消收藏"){
                    e.target.innerText = "收藏视频"
                }else{
                    e.target.innerText = "取消收藏"
                }
            }
        },
        mounted(){
            // let userID = getCookie('userid')
            // if(userID === null){
            //     this.$message({
            //         showClose: true,
            //         message: '不登录不可以偷看哦，请先登录！',
            //         type: 'error',
            //         duration:2001,
            //     });
            //     this.$router.push({path:'/login'})
            // }
            var isLogin = getCookie('isLogin')
            if(isLogin === null){
                this.isLogin = 'false'
            }else{
                this.isLogin = isLogin
            }

            let userid = getCookie('userid')
            console.log(userid)
            if(this.isLogin === 'false'){
                this.$axios.get('http://106.54.23.221:8080/course/get',{
                    params:{
                        userId:'',
                        courseId:this.courseID
                    }

                })
                    .then(
                        res => {
                            console.log(res)
                            if(res.data.data[0].price === 0){
                                this.course_isfree = 'true'
                            }
                            //chapter & userterm
                            this.wynews = res.data.data[1]
                            this.newsTotal = res.data.data[1].length

                            //设置course的内容
                            this.course_title =res.data.data[0].title
                            this.course_id =res.data.data[0].course_id
                            this.course_short =res.data.data[0].short_title
                            this.description_full =res.data.data[0].course_desc
                            this.isUpdating =res.data.data[0].is_complete
                            this.course_cover_url =res.data.data[0].img
                        })
                    .catch(
                        err => {
                            console.log(err)
                        }
                    )
            }else{
                this.$axios.get('http://106.54.23.221:8080/course/get',{
                    params:{
                        userId:userid,
                        courseId:this.courseID
                    }

                })
                    .then(
                        res => {
                            console.log(res)
                            if(res.data.data[0].price === 0){
                                this.course_isfree = 'true'
                            }
                            //判断视频是否被看过
                            this.wynews = res.data.data[1]
                            this.newsTotal = res.data.data[1].length
                            //
                            // for(var i=0;i<this.newsTotal;i++){
                            //     this.userterm.push(this.wynews[i].userTerm)
                            // }
                            // console.log(this.userterm)

                            //设置course的内容
                            this.course_title =res.data.data[0].title
                            this.course_id =res.data.data[0].course_id
                            this.course_short =res.data.data[0].short_title
                            this.description_full =res.data.data[0].course_desc
                            this.isUpdating =res.data.data[0].is_complete
                            this.course_cover_url =res.data.data[0].img
                            this.course_islike = res.data.data[0].is_like
                        })
                    .catch(
                        err => {
                            console.log(err)
                        }
                    )
            }


        }
    }
</script>

<style scoped>
    .g-brd-gray-light-v4{
        border-color:#eee!important;
    }
    .g-brd-teal{
        border-color:#18ba9b!important;
    }
    .g-brd-red{
        border-color: red!important;
    }
    .episode-list-item{
        background:#f7f7f7
    }
</style>
