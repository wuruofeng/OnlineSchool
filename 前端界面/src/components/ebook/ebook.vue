<template>
    <div>
        <section style="margin-top: 100px">
            <div class="g-bg-bluegray-lineargradient">
                <div class="container u-bg-overlay__inner g-py-110">
                    <div class="row align-items-center">
                        <div class="col-12 text-center">
                            <h2 class="h1 g-color-white" style="font-weight: 700">模拟 Subscription 实现 - III</h2>
                            <h4 class="g-color-white" style="font-weight: 200">基于MVVM构建泊学App</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="g-bg-gray-light-v4 text-uppercase">
                <div class="container">
                    <div class="row g-color-gray g-font-size-15 align-items-center">
                        <div class="col-md-auto g-py-15 g-brd-gray-light-v2 g-brd-right">
                            <a href="/" class="g-color-gray-dark-v1 g-color-gray-dark-v4--hover">
                                <i class="fa fa-long-arrow-left g-mr-5">
                                </i>返回视频列表</a>
                        </div>
                        <div class="col g-py-15 g-brd-gray-light-v2 g-brd-right">
                            <strong class="g-color-teal" style="font-size: 1.28571rem!important">预计阅读时间: <i>10分钟</i>
                            </strong>
                        </div>
                        护眼模式:
                        <el-tooltip :content="'护眼模式: '+ value5" placement="top" style="margin-left: 20px" >
                            <el-switch @change="ReadMode()"
                                    v-model="value5"
                                    active-color="#13ce66"
                                    inactive-color="#ff4949"
                                    active-value="开"
                                    inactive-value="关">
                            </el-switch>
                        </el-tooltip>
                        <div class="col-md-auto g-py-12 g-brd-gray-light-v2 g-brd-right"><a href="/series/build-boxue-app-in-mvvm/ebook/620" class="col-md-4 g-color-teal g-color-cyan--hover">
                            <strong>
                                <i class="fa fa-angle-left g-mr-10">
                                </i>Previous
                            </strong>
                        </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="container g-py-50 g-color-gray-dark-v1 bx-doc" style="font-size: 1.28571rem!important">
            <div v-html="ebookHTML">
                {{ebookHTML}}
            </div>
        </section>
    </div>
</template>

<script>
    export default {
        name: "ebook",
        data(){
            return{
                ebookHTML:'',
                series_title:'',
                episode_title:'',
                value5:'关',
            }
        },
        mounted() {
            this.$axios.get('/api/ebookmock.json')
                .then(
                    res => {
                        this.ebookHTML = res.data.eBook
                    })
                .catch(
                    err => {
                        console.log(err)
                    }
                )

        },
        methods:{
            ReadMode(){
                if(this.value5 === '开'){
                    $('#app').css("background","beige")
                }else{
                    $('#app').css('background','')
                }

            }
        }
    }
</script>

<style scoped>

</style>
