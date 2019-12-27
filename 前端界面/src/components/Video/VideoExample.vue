<template>
    <div>
        <div class="promo-bg g-py-50" style="margin-top: 100px" v-if="block === 1">
            <header class="text-center g-mb-60 g-color-gray-dark-v3">
                <div class=" g-brd-primary g-mb-20">
                    <h2 class="g-font-size-60 g-font-weight-300 u-heading-v2__title" >
                        <strong>Back to the Learning</strong>
                    </h2>
                </div>
                <p class="lead g-px-20"><strong>和你看过的免费视频一样，Onlineschool的300+技术视频会带给你同样的观看和学习体验</strong></p>
                <p class="lead g-px-20"><strong>
                    <router-link to="/join"  class="g-color-purple">订阅吧</router-link>，备好瓜子，搬好凳子，继续学习 :)</strong></p>
            </header>
            <div class="row">
                <div class="col-12 g-mb-50 g-mb-0--md text-center">
                    <router-link to="/join" class=" btn btn-md u-btn-primary rounded-0 g-mr-15--md">
                        <strong>续费后观看并下载所有视频</strong>
                    </router-link>
                </div>
            </div>

        </div>


<!--        上个锁-->
        <section style="margin-top: 100px" >
            <div class="g-bg-black" v-if="block === 0">
                <div class="container u-bg-overlay__inner g-py-15" style="max-width: 1520px">
                    <div class="row align-items-center g-px-50--md">
                        <div class="embed-responsive">
                            <pl-lazy time="500">
                                <video-player :options="videoOptions">

                                </video-player>
                            </pl-lazy>

                        </div>

                    </div>

                </div>
            </div>
            <div class="g-bg-gray-light-v4 text-uppercase">
                <div class="container">
                    <div class="row g-color-gray g-font-size-15 align-items-center">
                        <div class="col-md-auto g-py-15 g-brd-gray-light-v2 g-brd-right">
                            <a href="/series/build-boxue-app-in-mvvm" class="g-color-gray-dark-v1 g-color-gray-dark-v4--hover">
                                <i class="fa fa-long-arrow-left"></i>返回视频列表
                            </a>
                        </div>
                        <div class="col g-py-15 g-brd-gray-light-v2 g-brd-right">
                            <div class="input-group">
                                <el-input v-model="input_1" placeholder="在有启发的地方写几笔记录下来吧 :)" style="height: 39px;position: relative;flex: 1 1 auto;margin-bottom: 0;width: 1%;border-radius:0!important;"></el-input>
                                <el-button type="primary" style="background-color: #00bed6;position: relative;border-radius:0!important;">写个笔记</el-button>
                                <canvas height="2160" width="3840" hidden="hidden"></canvas>
                            </div>
                        </div>
                        <div class="col-md-auto g-py-15 g-brd-gray-light-v2 g-brd-right">
                            <span class="col-md-4 g-color-dark-v4">
                                <strong>
                                    <i class="fa fa-level-up" ></i> Level: Advanced
                                </strong>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="g-py-50">
            <div class="container">
                <div class="row g-mb-50">
<!--                    v-for="(newsItem,index) of tempNews" :key='index' v-if="index <= 0"-->
                    <div class="col-md-6" >
                        <li class="list-inline-item g-mb-10">
                            <a class="u-tags-v1 g-brd-around g-rounded-50 g-py-4 g-px-15 g-color-red g-brd-red g-bg-red-opacity-0_1 g-bg-red--hover g-color-white--hover ">
                                <i class="fa fa-check">标记看完</i>
                            </a>
                            <div class="g-mt-15 h6 text-uppercase " style="color:#a7a7a7;" >
                                <strong>Published on {{updated_at_year_month}}</strong>
                            </div>
                            <p class="g-mt-15 h1" style="color:#a7a7a7;font-weight: 300"> {{course_name}}：</p>
                            <strong class="g-mt-15 h1 g-color-gray-dark-v1"><span class="g-color-black">{{video_title}}</span></strong>
                            <div class="g-mt-10 g-mb-35 h5 text-uppercase">
                                <strong class="m-0 g-color-gray-dark-v1" style="font-weight:400">Episode {{index}}</strong>
                                <span class="g-color-gray-dark-v1 h6 divider">&nbsp;&nbsp;●&nbsp;&nbsp;</span>
                                <strong class="g-color-teal">RUN TIME {{episode_duration}}</strong>
                            </div>

<!--                            three btns-->
                        <li class="list-inline-item g-mb-10">
                            <a :href=true_download_url class="col-md-auto  btn btn-md u-btn-inset u-btn-inset--rounded u-btn-teal g-font-weight-600 g-letter-spacing-0_5 text-uppercase g-brd-2 g-rounded-50 g-mr-10 g-mb-15">
                                <i class="fa fa-cloud-download g-mr-3"></i>
                                离线下载
                            </a>
                        </li>
                        <li class="list-inline-item g-mb-10">
                            <a class="col-md-auto col-12 btn btn-md u-btn-inset u-btn-inset--rounded u-btn-pink g-color-white g-font-weight-600 g-letter-spacing-0_5 text-uppercase g-brd-2 g-rounded-50 g-mr-10 g-mb-15">
                                <i class="fa fa-heart g-mr-5"></i><strong>添加收藏</strong>
                            </a>
                        </li>
                        <li class="list-inline-item g-mb-10">
                            <a  :href=stringcatebookURL(this.id,course_id) target="_blank" class="col-md-auto col-12 btn btn-md u-btn-inset u-btn-inset--rounded u-btn-indigo g-font-weight-600 g-letter-spacing-0_5 text-uppercase g-brd-2 g-rounded-50 g-mr-10 g-mb-15">
                                    <i class="fa fa-book g-mr-3">视频文档</i>

                            </a>
                        </li>
                    </div>
                    <!--                        右边导读栏-->
                    <div class="col-md-6 align-self-center" >
                        <p class="h5 g-color-gray-dark-v4 g-mb-25" style="line-height: 1.7;font-weight:400" v-html="description">

                        </p>
                        <a href="#" class="btn btn-sm u-btn-outline-cyan g-font-weight-600 g-letter-spacing-0_5 text-uppercase g-rounded-5 g-mr-10 g-mb-15">
                            <i class="fa fa-chevron-left g-ml-3"></i> previous
                        </a>
                        <a class="btn btn-sm u-btn-outline-cyan g-font-weight-600 g-letter-spacing-0_5 text-uppercase g-rounded-5 g-mr-10 g-mb-15" style="display: none;">
                            next
                            <i class="fa fa-chevron-right g-ml-3"></i>
                        </a>
                    </div>

                </div>
                <div class="u-divider u-divider-center u-divider-linear-gradient u-divider-linear-gradient--gray-light-v3 w-100 mx-auto g-my-40"><i class="fa fa-angle-down u-divider__icon g-bg-gray-light-v4 g-color-gray-light-v1 rounded-circle" style="font-size: 20px;padding-top: 10px" ></i></div>
                <div class="row">
                    <div class="col-md-7 g-brd-gray-light-v2" v-if="isLogin === 'false'">
                        <h4 class="g-color-gray-dark-v4 g-mt-30 g-mb-20">视频笔记</h4>
                        <div role="alert" class="alert alert-warning">
                            <a href="/login"  class="alert-link">登录</a>
                            后添加视频笔记，或
                            <a href="/join" class="primary-color">
                                点击这里
                            </a>注册泊学账号。
                        </div>
                    </div>

                    <div class="col-md-7 g-brd-gray-light-v2" v-if="isLogin === 'true'">
                        <h4 class="g-color-gray-dark-v4 g-mt-30 g-mb-20">视频笔记</h4>
                        <div role="alert" class="alert alert-warning">
                            这是登录后的界面，上线用
                        </div>
                    </div>
                    <div class="col-md-5 g-brd-left--md g-brd-gray-light-v2">
                        <div class="table-responsive">
                            <h4 class="g-color-gray-dark-v4 g-mt-30 g-mb-20">{{course_name}}</h4>
                            <table class="table table-hover">
                                <tbody>
                                <tr v-for="(newsItem,index) of tempNews" :key="'info2-'+ index" v-if="index <= 88">
                                    <td class="h5 g-color-primary"><strong>{{index+1}}</strong></td>
                                    <td class="h5 g-color-primary" style="font-weight:400"><a :href=stringcatvedioURL(newsItem.term.id,course_id) class="g-color-teal--hover g-color-black">{{newsItem.term.title}}</a></td>
                                    <td class="hidden-sm h5 g-color-gray-light-v1" style="font-weight:400"><strong>{{newsItem.term.duration}}</strong></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

<!--                   1 -->
                </div>

<!--               2 -->
            </div>
        </section>
        <div class="container">
            <div class="row">
                <Comment v-if="isLogin === 'true'"></Comment>
            </div>

        </div>




    </div>
</template>

<script>
    import VideoPlayer from "./VideoPlayer";
    import Comment from '@/components/comment/components/Comment.vue'
    import  {setCookie,getCookie,delCookie} from  '@/util/cookie'
    export default {
        name: "VideoExample",
        components: {
            VideoPlayer,
            Comment
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
        },
        data() {
            return {
                true_download_url:'',
                videoOptions: {
                    autoplay: false,
                    controls: true,
                    sources: [
                        {
                            src:
                                "https://free-video.boxueio.com/z62-asynchronous-values-in-combine.mp4",
                            type: "video/mp4",

                        }
                    ]
                },
                options:{
                    sources: [

                    ]

                },
                input_1:"",
                total:12,
                news:[],
                sliceArr: [],
                isLogin:'false',
                //now is video things

                id:'',
                video_title:'',
                index:'',
                exp:'',
                description:'',
                updated_at_day:'',
                updated_at_year_month:'',
                episode_duration:'',
                cover_url:'',
                is_free:1,
                //now is course things
                course_name:'',
                course_chapter_duration:'',
                course_chapter_name:'',
                course_chapter_id:'',
                //上锁
                block:1,
                course_id:'',



            };
        },
        computed:{
            tempNews: function () {
                for(let i = 0;i < this.total; i++){
                    this.sliceArr.push(this.news[i])
                }
                return this.sliceArr.slice(12)
            },
        },
        mounted() {
            this.course_id = this.$route.params.courseID
            var isLogin = getCookie('isLogin')
            if(isLogin === null){
                this.isLogin = 'false'
            }else{
                this.isLogin = 'true'
            }
            if(this.isLogin === 'true'){
                this.block = 0
            }
            console.log(this.isLogin)
            console.log(this.block)
            const that = this
            //axios for video
            this.$axios.get('http://106.54.23.221:8080/term/id',{
                params:{
                    id:this.$route.params.chapterID
                }
            })
                .then(
                    res => {
                        console.log(res)
                        this.true_download_url = res.data.data.true_download_url
                        this.videoOptions.sources[0].src = this.true_download_url
                        console.log(this.videoOptions.sources[0].src)
                        this.id = res.data.data.index
                        this.video_title = res.data.data.title
                        // this.index = res.data.data.index
                        this.exp = res.data.data.exp
                        this.updated_at_day = res.data.data.updated_at_day
                        this.description = res.data.data.description
                        this.updated_at_year_month = res.data.data.updated_at_year_month
                        this.episode_duration = res.data.data.episode_duration
                        this.cover_url = res.data.data.cover_url
                        this.is_free = res.data.data.is_free
                        // 解锁
                        if(this.is_free === 1){
                            this.block = 0
                        }

                        // course_name:'',
                        //     course_chapter_duration:'',
                        //     course_chapter_name:'',
                        //     course_chapter_id:'',
                        this.course_name = res.data.data.courseY.title

                    })
                .catch(
                    err => {
                        console.log(err)
                    }
                )

            //右下角

                this.$axios.get('http://106.54.23.221:8080/course/get',{
                    params:{
                        userId:'',
                        courseId:this.course_id,
                    }
                })
                    .then(
                        res => {
                            console.log(res)
                            this.news = res.data.data[1]
                            this.total = res.data.data[1].length


                        })
                    .catch(
                        err => {
                            console.log(err)
                        }
                    )







        },

    }
</script>

<style scoped>
    /*全局*/
    .btn:hover{
        color: white;
    }
    .u-btn-indigo:hover{
        background-color:#4263a3c4;
    }
    .promo-bg{
        height:140%;
        background:url("https://vue13.oss-cn-chengdu.aliyuncs.com/myfile/pattern2.png")
    }
    .g-brd-primary{
        border-color:#e6125d!important
    }
    .u-heading-v2-3--bottom:after, .u-heading-v2-3--top:before{
        width: 5rem!important;
        border-top-width: 1px!important;
    }
    .u-heading-v2-3--bottom:after{
        margin-top:1.07143rem!important;
    }
</style>
