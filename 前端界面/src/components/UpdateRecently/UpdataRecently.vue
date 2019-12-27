<template>
    <div>
        <el-container>
            <section class="g-mb-20" v-if="isLogin === 'true'">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 g-mt-25">
                            <div class="text-uppercase text-center g-line-height-1_3 g-mb-20">
                                <h2 class="g-font-size-36 mb-0">My <strong class="g-color-black">OnlineSchool</strong></h2></div>
                            <div class="row g-mb-40">
                                <div class="col-md-6 g-mb-30 g-mb-0--md">
                                    <div class="g-color-white g-pa-25 g-bg-cyan">
                                        <header class="d-flex text-uppercase g-mb-40">
                                            <i class="fa fa-check-square-o align-self-center display-4 g-mr-20 g-font-size-60" ></i>
                                            <div class="g-line-height-1">
                                                <h4 class="h5">观看总时长</h4>
                                                <div  class="g-font-size-30" style="display: inline;">{{totally_watching_times}}
                                                </div>
                                                <em class="g-font-size-16">MIN</em>
                                            </div>
                                        </header>
                                        <div class="d-flex justify-content-between text-uppercase g-mb-25">
                                            <div class="g-line-height-1">
                                                <h5 class="h6 g-font-weight-600">已完成视频个数</h5>
                                                <div  class="g-font-size-16">{{totally_watching_num}}
                                                </div>
                                            </div>
                                            <div class="text-right g-line-height-1">
                                                <h5 class="h6 g-font-weight-600">当前视频总数</h5>
                                                <div  class="g-font-size-16">60</div>
                                            </div>


                                        </div>
                                        <h6 class="g-mb-10">视频完成率 <span class="float-right g-ml-10">{{pencent_1.toFixed(2)*100}}%</span></h6>
                                        <el-progress :text-inside="true" :stroke-width="18" :percentage=pencent_1.toFixed(2)*100  :color="'#6983ff'"></el-progress>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="g-color-white g-pa-25 g-bg-purple">
                                        <header class="d-flex text-uppercase g-mb-40">
                                            <i class="fa fa-book align-self-center display-4 g-mr-20 g-font-size-60" ></i>
                                            <div class="g-line-height-1">
                                                <h4 class="h5">当前经验值</h4>
                                                <div  class="g-font-size-30" style="display: inline;">{{exp}}
                                                </div>
                                                <em class="g-font-size-16">小萌新</em>
                                            </div>
                                        </header>
                                        <div class="d-flex justify-content-between text-uppercase g-mb-25">
                                            <div class="g-line-height-1">
                                                <h5 class="h6 g-font-weight-600">本周经验值</h5>
                                                <div  class="g-font-size-16">1250
                                                </div>
                                            </div>
                                            <div class="text-right g-line-height-1">
                                                <h5 class="h6 g-font-weight-600">上周经验值</h5>
                                                <div  class="g-font-size-16">0</div>
                                            </div>


                                        </div>
                                        <h6 class="g-mb-10">Exp <span class="float-right g-ml-10">{{pencent_2.toFixed(2)*100}}%</span></h6>
                                        <el-progress :text-inside="true" :stroke-width="18" :percentage=pencent_2.toFixed(2)*100 :color="'#6983ff'"></el-progress>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <el-header class="header_">
                <div class="child-center">
                    <h2 style="text-align: center;font-size:40px;color:#777;line-height:1.2;font-weight: 700;">
                        <i class="fa fa-calendar fa-1x"></i>
                        <i style="">
                            最近更新
                        </i>
                    </h2>
                </div>
            </el-header>
            <div class="url-router">
                <router-link to="/more" ><span class="mb-0 g-font-size-15" style="color:#e6125d">查看完整视频更新列表</span></router-link>
            </div>
<!--            main模块-->
            <el-main>

                <div>
                    <Pagination :wynews='wynews' :totalPages='Math.ceil(newsTotal / 5)' :total='newsTotal'
                                :current-page='currentPage' @pagechanged='handleChange'/>
                </div>

            </el-main>
        </el-container>



    </div>

</template>

<script>
    import Pagination from './pagination/pagination'
    import  {setCookie,getCookie,delCookie} from  '@/util/cookie'

    export default {
        name: "UpdataRecently",
        components:{
            Pagination
        },
        data(){
            return{
                currentPage:1,
                wynews: [],
                newsTotal:0,
                totally_watching_num:0,
                totally_watching_times:0,
                exp:0,
                isLogin: 'false',

            }
        },
        computed:{
          pencent_1:function () {
              return this.totally_watching_num/60
          },
            pencent_2:function () {
                return this.exp/10000;
            }
        },
        methods:{
            handleChange:function (page) {
                this.currentPage = page;
            },

        },
        mounted(){
            this.totally_watching_num = getCookie('totally_watching_num')
            this.totally_watching_times = getCookie('totally_watching_times')
            this.exp = getCookie('exp')
            var isLogin = getCookie('isLogin')
            if(isLogin === null){
                this.isLogin = 'false'
            }else{
                this.isLogin = isLogin
            }
            this.$axios.get('http://106.54.23.221:8080/term/')
                .then(
                    res => {
                        console.log(res)
                        this.wynews = res.data.data
                        this.newsTotal = res.data.data.length
                        console.log(res.data.data)
                    }
                )
                    .catch(
                        err =>{
                            console.log(err)
                        }
                    )


        }
    }

</script>

<style scoped>
    h1, h2 {
        font-weight: normal;
    }
    ul {
        list-style-type: none;
        padding: 0;
    }
    li {
        display: inline-block;
        margin: 0 10px;
    }
    a {
        color: #42b983;
    }

    .child-center{
        text-align: center;
        margin-top: 0;
    }
    .header_{
        margin-top: 50px;
    }
    .url-router{
        text-align: center;

    }
    .g-bg-cyan{
        background-color:#00bed6!important
    }


</style>
