<template>
    <div>
        <section class="g-bg-gray-light-v5" style="margin-top:100px">
            <div class="container g-py-100">
                <div class="row justify-content-center">
                    <div class="col-sm-10 col-md-9 col-lg-6">
                        <div class="u-shadow-v21 g-bg-white rounded g-py-40 g-px-30">
                            <header class="text-center mb-4">
                                <h2 class="h2 g-color-black g-font-weight-600">Let's get started</h2>
                            </header>
                            <h2 class="h5 u-heading-v6__title g-color-gray-dark-v3 mb-4">选择订阅类型</h2>
                            <div>
                                <form class="mb-5"><div class="row"><div class="col-12 mb-4">
                                    <select class="form-control rounded-0 g-font-size-16 g-py-15" style="height: 47.58px;">
                                        <option value="1" :selected="monthflag">按月订阅（¥59）</option>
                                        <option value="2" :selected="yearflag">按年订阅（¥512）</option>
                                        <option value="3" :selected="fulllifeflag">终身会员（¥1280）</option>
                                    </select>
                                </div>
                                    <div class="col-12">
                                        <div class="input-group">
                                            <span class="input-group-btn">
                                                <button type="button" class="g-height-100x btn btn-md u-btn-pink rounded-0" @click="randomInviteCode">手气不错
                                                </button>
                                            </span>
                                            <input type="text" placeholder="点左边试试手气吧 :P）" class="g-font-size-16 form-control g-brd-cyan--hover form-control-md rounded-0 invitecodeinput" style="height: 39px;">
                                            <span class="input-group-btn">
                                                <button type="button" class="g-height-100x btn btn-md u-btn-cyan rounded-0" @click="chageword()">确认邀请码
                                                </button>
                                            </span>
                                        </div>
                                        <div class="text-info mt-2 bingo" style="display: none">
                                            <div class="form-control-feedback">Bingo，你收到了终身会员
                                                <a href="http://wuruofeng.vip/">wuruofeng</a>
                                                分享的邀请码，点击【确认邀请码】查看优惠吧 :)
                                            </div>
                                        </div>

                                        <a href="#"  class="mt-2 g-color-cyan" style="display: block; text-align: right;" @click="notify_open">什么是邀请码和优阅基金？
                                        </a>
                                    </div>
                                </div>
                                </form>
                                <h2 class="h5 u-heading-v6__title g-color-gray-dark-v3 mb-4">填写登录信息</h2>
                                <form>
                                    <div class="mb-4">
                                        <ValidationProvider name="用户名" rules="required" v-slot="{ errors,classes}">
                                            <input type="text" v-model="username" name="email" placeholder="UserName" class="g-font-size-18 form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-cyan--hover rounded g-py-15 g-px-15">
                                            <span style="color:red;font-size: 16px;line-height: 30px;padding: 0 0 0 24px;">{{ errors[0] }} </span>
                                        </ValidationProvider>
                                    </div>
                                    <div class="row">
                                    <div class="col-12 mb-4">
                                        <ValidationProvider name="密码" rules="required" v-slot="{ errors,classes}">
                                        <input type="password" v-model="password" name="password" placeholder="Password" class="g-font-size-18 form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-cyan--hover rounded g-py-15 g-px-15"> <!---->
                                            <span style="color:red;font-size: 16px;line-height: 30px;padding: 0 0 0 24px;">{{ errors[0] }} </span>
                                        </ValidationProvider>
                                    </div>
                                    <div class="col-12 mb-4">
                                        <input type="password" v-model="password_repeat" name="password_confirmation" placeholder="Repeat Password" class="g-font-size-18 form-control g-color-black g-bg-white g-bg-white--focus g-brd-gray-light-v4 g-brd-cyan--hover rounded g-py-15 g-px-15"> <!---->
                                    </div>
                                </div>
                                    <div class="row justify-content-between mb-5">
                                        <div class="col-md-8 align-self-center">
                                            <label class="form-check-inline u-check g-color-gray-dark-v5 g-font-size-13 g-pl-25 check_box">
                                                <el-checkbox v-model="checked" class="">我已阅读并同意
                                                    <a href="/terms-of-service" style="color: red">服务条款</a>
                                                </el-checkbox>
<!--                                                <input type="checkbox" name="agree_tos" class="g-hidden-xs-up g-pos-abs g-top-0 g-left-0">                                              <div class="u-check-icon-checkbox-v6 g-absolute-centered&#45;&#45;y g-left-0">-->
<!--                                                <i class="fa fa-check" aria-hidden="true"></i>-->

<!--                                            </div>-->
                            </label>
                                        </div> <div class="col-md-4 align-self-center text-sm-right">
                                        <button type="button" @click="toregister()" class="btn btn-md u-btn-cyan rounded-0 g-py-13 g-px-10 g-width-100x--sm">成为会员吧!
                                    </button>
                                    </div>
                                    </div>
                                </form>
                                <div>

                                </div>
                            </div>
                            <footer class="text-center"><p class="g-color-gray-dark-v5 g-font-size-13 mb-0">已有账号?
                                <router-link to="/login" class="g-font-weight-600" style="color: red;">点击这里登录</router-link>
                            </p>
                            </footer>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
    // import axios from 'axios'
    export default {
        name: "register",
        data(){
            return{
                yearflag: false,
                monthflag: false,
                fulllifeflag: false,
                checked:false,
                username:'',
                password:'',
                password_repeat:'',

            }
        },
        mounted() {
            if(this.$route.params.timeType === 'month'){
                this.monthflag = true;
            }
            if(this.$route.params.timeType === 'year'){
                this.yearflag = true;
            }
            if(this.$route.params.timeType === 'fulllife'){
                this.fulllifeflag = true;
            }
        },
        methods:{
            randomInviteCode(){
                $('.invitecodeinput').attr('placeholder','ec84c3dd183b0acc820d5eae474d499d');
                $('.bingo').css('display','');
            },
            notify_open(){
                this.$notify({
                    title: '关于邀请码',
                    message: '邀请码来自会员发起的订阅邀请，通过邀请码订阅，你将会获得额外的优阅基金。',
                    offset: 100
                });
            },
            chageword(){
                $('.bingo').html('你获得了来自终身会员wuruofeng的邀请。按月订阅将获得20元阅读基金。')
            },
            toregister(){
                if(this.checked === false){
                    this.$message({
                        showClose: true,
                        message: '请勾选服务条款！',
                        type: 'error',
                        duration:2001,
                    });
                }
                else if(this.password === '' || this.username===''){
                    this.$message({
                        showClose: true,
                        message: '用户名或密码不可以为空！',
                        type: 'error',
                        duration:2001,
                    });
                }
                else if (!(this.password === this.password_repeat)){
                    this.$message({
                        showClose: true,
                        message: '两次密码输入不一致！',
                        type: 'error',
                        duration:2001,
                    });
                } else{
                    axios.post('http://106.54.23.221:8080/users/register',{
                        userName:this.username,
                        passWord:this.password
                }).then((res) => {
                        console.log(res)
                        if(res.data.code === 1){
                            // let expireDays = 1000 * 60 * 60 * 24 * 15;
                            // this.setCookie('session', response.data.session, expireDays);
                            //登录成功后
                            console.log("注册成功！")
                            this.$alert('注册成功！点击确定返回主界面', '恭喜', {
                                confirmButtonText: '确定',
                                callback: action => {
                                    this.$router.push({path:'/'})
                                }
                            });
                             // this.$router.push({path:'/'})
                        }else{
                            console.log(res);
                            console.log("注册失败！")
                            this.$message({
                                showClose: true,
                                message: '位置错误，注册失败！',
                                type: 'error',
                                duration:2001,
                            });
                        }
                    })

                }


            }
        },

    }
</script>

<style scoped>
.btn:hover{
    color: white;
}
.u-btn-pink:hover{
    background-color: #e81c62ad;
}
.check_box{
    position: absolute!important;
    padding-left: 0!important;
    margin-left: 0!important;
}

</style>
