<template>
    <div class="container">
        <div class="row">
            <div style="width: 100%">
                <ul class="list-unstyled">
                    <article v-for="(newsItem,index) of tempNews" :key='index' class="d-md-table w-100 g-bg-white g-mb-1">
                        <div class="d-md-table-cell align-middle g-width-125--md text-center g-color-gray-dark-v5 g-pfy-10 g-px-20">
                            <span class="d-block g-color-gray g-font-weight-700 g-font-size-40 g-line-height-1">
                                {{newsItem.term.duration}}
                            </span>{{newsItem.term.updated_at_year_month}}
                        </div>

                        <div class="d-md-table-cell align-middle g-py-15 g-px-20">
                            <h3 class="h6 g-font-weight-700">
                                <a :href=stringcatvedioURL(newsItem.term_id,newsItem.term.course_id) class="g-color-gray-dark-v2 h5">
                                    <strong>{{newsItem.term.title}}</strong>
                                </a>
                            </h3>
                            <div class="g-font-size-15">
                                <strong class="m-0 g-color-gray-dark-v5">
                                    <a :href=stringseriesURL(newsItem.term.course_id)  class="g-color-gray-dark-v5">
                                        {{newsItem.term.title}}
                                    </a>
                                </strong>

                            </div>
                        </div>

                        <div class="d-md-table-cell align-middle text-md-right g-pa-20">
                            <div class="g-mt-minus-10 g-mx-minus-5">
                                <a :href=stringcatebookURL(newsItem.term_id,newsItem.term.course_id)  class="btn1 btn btn-lg u-btn-outline-cyan g-font-weight-600 g-font-size-12 text-uppercase g-mx-5 g-mt-10">阅读文档</a>
                                <a :href=stringcatvedioURL(newsItem.term_id,newsItem.term.course_id) class="btn2 btn btn-lg u-btn-primary g-font-weight-600 g-font-size-12 text-uppercase g-mx-5 g-mt-10">观看视频</a>
                            </div>
                        </div>
                    </article>
                </ul>
                <ul class="pagination">
                    <li>
                        <button type='button' @click='handleClickFirst' :disabled='isPrev'>|<</button>
                    </li>
                    <li>
                        <button type="button" name="button" @click='handleClickPrev' :disabled='isPrev'><</button>
                    </li>
                    <li v-for='(page,index) of pages' :key='index'>
                        <button type="button" name="button"
                                @click='handleClickPage(page.name)'
                                :disabled='page.isDisabled'
                                :class="{active: isActivePage(page.name)}"
                        >{{page.name}}</button>
                    </li>
                    <li>
                        <button type="button" name="button" @click='handleClickNext' :disabled='isNext'>></button>
                    </li>
                    <li>
                        <button type='button' @click='handleClickLast' :disabled='isNext'>>|</button>
                    </li>
                </ul>
            </div>
        </div>


    </div>
</template>

<script>

    export default {
        name: 'pagination',
        props: {
            wynews:{
                type: Array,
                required: true
            },
            maxVisibleButtons: {
                type: Number,
                required: false,
                default:3
            },
            totalPages: {
                type: Number,
                required: true
            },
            total: {
                type: Number,
                required:true
            },
            currentPage: {
                type: Number,
                required: true
            }
        },
        data () {
            return {
                sliceArr: []
            }
        },
        computed: {
            isPrev:function () {
                return this.currentPage === 1
            },
            isNext:function () {
                return this.currentPage === this.totalPages
            },
            startPage: function () {
                if (this.currentPage === 1) {
                    return 1
                }
                if (this.currentPage === this.totalPages) {
                    return this.totalPages - this.maxVisibleButtons + 1
                }
                return this.currentPage - 1
            },
            endPage: function () {
                return Math.min(this.startPage + this.maxVisibleButtons - 1,this.totalPages)
            },
            pages: function () {
                const range = []
                for (let i = this.startPage; i <= this.endPage;i++) {
                    range.push({
                        name: i,
                        isDisabled: i === this.currentPage
                    })
                }
                return range
            },
            tempNews: function () {
                for(let i = 0;i < this.total; i++){
                    this.sliceArr.push(this.wynews[i])
                }
                if(this.total % 2 === 0) {
                    return this.sliceArr.slice((this.currentPage - 1) * 5,this.currentPage * 5)
                }
            }
        },
        methods: {
            stringcatvedioURL:function(chapterID,courseID){
                return ('/series/'+courseID+'/episode/'+chapterID)
            },
            stringcatebookURL:function(chapterID,courseID){
                return ('/series/'+courseID+'/ebook/'+chapterID)
            },
            stringseriesURL:function(courseID){
                return ('/series/'+courseID)
            },

            handleClickFirst: function () {
                this.$emit('pagechanged',1)
            },
            handleClickPrev: function () {
                if(this.currentPage === 1){
                    this.$emit('pagechanged',1)
                }else{
                    this.$emit('pagechanged',this.currentPage - 1)
                }
            },
            handleClickPage: function (page) {
                this.$emit('pagechanged',page)
            },
            handleClickNext: function () {
                if(this.currentPage === this.totalPages){
                    this.$emit('pagechanged',this.totalPages)
                }else{
                    this.$emit('pagechanged',this.currentPage + 1)
                }
            },
            handleClickLast: function () {
                this.$emit('pagechanged',this.totalPages)
            },
            isActivePage: function (page) {
                return this.currentPage === page;
            },
        }
    }
</script>

<style lang="css" scoped>
    .btn1{
        color: #00bed6;
        line-height: 1.6;
        border-color: #00bed6;
    }
    .btn2{
        line-height: 1.6;
        border-color: #e6125d;
    }
    .btn2:hover{
        color: white;
    }
    .u-btn-outline-cyan:hover{
        color: #ffffff;
        background-color: #00bed6;
    }


    .pagination{
        display: flex;
        width: 500px;
        margin:0 auto;
    }
    .pagination li{
        margin: 0 auto;
        list-style: none;
    }
    .pagination li button{
        /*border:none;*/
        /*width:44px;*/
        /*height:28px;*/
        /*outline-style: none;*/
        /*font-size:14px;*/

        width: 31px;
        height: 30px;
        border: 1px solid #EBEBEB;
        margin-left: -1px;
        color: #000;
        display: inline-block;
        line-height: 30px;
        float: left;
        font-size: 13px;
        text-decoration: none;
        margin: 0 2px;
        border-radius: 20px;

    }
    .pagination li button:hover{
        border-color: #ff0000;
        color: #ff0000;
        position: relative;

    }
    .pagination li button.active {
        background-color: red;
        color: white;
        border-color: #ff0000;
        position: relative;

    }
</style>


<!--<div v-for="(newsItem,index) of tempNews" :key='index' class='news_box'>-->
<!--    <div class='left_img'>-->
<!--        <a :href='newsItem.path'><img :src='newsItem.image' style='{width:140px;height:88px;}'></a>-->
<!--    </div>-->
<!--    <div class='right_info'>-->
<!--        <a :href='newsItem.path' style='{color:black;}'><p class='title'>{{newsItem.title}}</p></a>-->
<!--        <p class='time'>{{newsItem.passtime}}</p>-->
<!--    </div>-->
<!--</div>-->
