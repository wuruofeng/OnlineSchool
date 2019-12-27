<template>
    <div id="JavaSection">
        <el-container>
            <el-header class="header_">
                <div class="child-center">
                    <h4 class="top_line">从以下任意一个你感兴趣的话题开始</h4>
                    <h2 style="text-align: center; font-family: FontAwesome;font-size:40px;color:#777;line-height:1.2;font-weight: 700;">
                        <i class="fa fa-eercast fa-1x"></i>
                        <i style="">
                            Java修炼
                        </i>
                    </h2>

                </div>
                <div style="text-align: center; margin-top: 20px">
                    <i class="fa fa-circle g-px-10 primary-color"></i>
                </div>
                <p class="g-color-gray-dark-v4" style="text-align: center;line-height: 1.5;font-size: 1rem;font-weight: 400;margin-top: 20px">学会动手，做一遍才能理解其中的技术细节。</p>

            </el-header>
            <el-main style="margin-top: 100px">
            <section class="container g-pb-70">
                <div class="row">
                    <div v-for="(newsItem,index) of tempNews" class="col-lg-4 g-mb-30"  :key='index' v-if="index <= 5">
                        <div class="d-md-flex justify-content-md-center text-center g-mb-20"></div>
                        <article class="u-shadow-v22 card">
                            <figure class="g-pos-rel u-block-hover">
                                <a :href= stringseriesURL(newsItem.course_id)>

                                    <img :src=newsItem.course_cover_url ref="acp" class="img-fluid w-100 u-block-hover__main--zoom-v1"  />
                                    <span  class="u-block-hover__additional--fade g-bg-black-opacity-0_3 g-color-aqua" @mouseenter="mouseOver(index)" @mouseleave="mouseLeave(index)">
                                        <i class="fa fa-play-circle-o  g-absolute-centered g-font-size-70" ></i>
                                    </span>

                                </a>

                            </figure>

                            <div class="g-pa-20">
                                <h3 class="h4 g-font-weight-300 g-mb-15">
                                    <a :href=stringseriesURL(newsItem.course_id)  class="u-link-v5 g-color-main g-color-primary--hover g-text-underline--none--hover">{{newsItem.course_title}}</a>
                                </h3>
                                <div class="g-mb-30">
                                    <p>{{newsItem.description_short}}</p>
                                </div>
                                <div class="media g-font-size-12">
                                    <div class="media-body align-self-center text-uppercase">
                                        <span class="h3" style="color: #666">{{newsItem.course_length}}</span>
                                        <span>Videos</span>
                                    </div>
                                    <div class="align-self-center" >
                                        <i class="fa fa-refresh" style="font-size: 15px;color: #666"></i>&nbsp;&nbsp;
                                        <span>{{newsItem.course_updata_time}}</span>
                                    </div>
                                </div>

                            </div>
                        </article>

                    </div>
                </div>
            </section>
            </el-main>
        </el-container>
    </div>
</template>

<script>
    export default {
        name: "JavaSection",
        props:{
            wynews: {
                type: Array,
                required: true
            },
            total: {
                type: Number,
                required:true
            },
        },
        mounted(){
            //console.log(this.tempNews)
        },
        methods:{
            mouseOver(index){
                var acps = this.$refs.acp[index]
                acps.style.transform = "scale(1.2)";
            },
            mouseLeave(index){
                var acps = this.$refs.acp[index]
                acps.style.transform = "scale(1)";
            },
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
        data(){
            return {
                sliceArr: [],
            }
        },
        computed:{
            tempNews: function () {
                for(let i = 0;i < this.total; i++){
                    this.sliceArr.push(this.wynews[0].courseYList[i])
                }
                //console.log(this.wynews[0])
                return this.sliceArr
            }
        }
    }



    //css遮罩

</script>

<style scoped>
.header_{
    margin-top: 80px;
}
.child-center{
    text-align: center;
    margin-top: 0;
}
.top_line{
    margin-bottom: 1rem;
    color: #e6125d!important;
    font-weight: 700;
    font-size: 12px;
    margin-top: 0;
}

.container{
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}

</style>
