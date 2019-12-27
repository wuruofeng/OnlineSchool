<template>
    <div>
        <div class="card border-0 g-mb-20">
            <div class="card-header d-flex align-items-center justify-content-between g-bg-gray-light-v5 border-0 g-mb-15">
                <h3 class="h4 mb-0">
                    <i class="g-font-size-26 fa fa-star g-color-gray-dark-v2">&nbsp;&nbsp;&nbsp;Favourites
                    </i>
                </h3>
            </div>
        </div>

        <div>
            <Pagination1 :wynews='wynews' :totalPages='Math.ceil(newsTotal / 5)' :total='newsTotal'
                        :current-page='currentPage' @pagechanged='handleChange'/>
        </div>
    </div>
</template>

<script>
    import Pagination1 from './pagination'
    import  {setCookie,getCookie,delCookie} from  '@/util/cookie'
    export default {
        name: "myfavourite",
        components:{
            Pagination1,
        },
        data(){
            return{
                currentPage:1,
                wynews: [],
                newsTotal:0,
                userid:'',

            }
        },
        methods:{
            handleChange:function (page) {
                this.currentPage = page;
            },

        },
        mounted(){
            this.userid  = getCookie('userid')


            this.$axios.get('http://106.54.23.221:8080/term/user_id?user_id='+this.userid)
                .then(
                    res => {
                        console.log(res)
                        this.wynews = res.data.data
                        this.newsTotal = res.data.data.length
                        // console.log(this.wynews)
                        //console.log(this.newsTotal)
                    })
                .catch(
                    err => {
                        console.log(err)
                    }
                )
        }
    }
</script>

<style scoped>


</style>
