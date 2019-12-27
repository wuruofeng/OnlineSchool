<template>
    <div>
       <div class="g-bg-orange-lineargradient" style="margin-top: 100px">
            <div class="container u-bg-overlay__inner g-py-110" >
                <div class="row align-items-center">
                    <div class="col-12 text-center">
                        <h1  class="g-color-white" style="font-weight:300;font-size: 50px">Profile</h1>
                        <h4 class="g-color-white" >
                            <i style="font-weight: 200;font-size: 20px">Work hard, have fun, no drama.</i>
                        </h4>
                    </div>
                </div>
            </div>
       </div>

        <section class="g-my-50">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 g-mb-50 g-mb-0--lg">
                        <div class="list-group  g-mb-40 g-font-size-16">
                            <div  id="item1" @click="addClass($event)" class=" list-group-item list-group-item-action justify-content-between g-py-14"  style="text-align: center">
                                <span>
                                    <i class="fa fa-user-circle" >&nbsp;&nbsp;&nbsp;账号设置</i>
                                </span>
                            </div>

                            <div id="item2" @click="addClass($event)" class=" list-group-item list-group-item-action justify-content-between g-py-14" style="text-align: center">
                                <span>
                                    <i class="fa fa-star">&nbsp;&nbsp;&nbsp;我的收藏</i>
                                </span>
                            </div>


                            <div id="item3" @click="exit()" class=" list-group-item list-group-item-action justify-content-between g-py-14" style="text-align: center">
                                <span>
                                    <i class="fa fa-sign-out">&nbsp;&nbsp;&nbsp;退出登录</i>
                                </span>
                            </div>
                        </div>
                    </div>
<!--                1-->
                    <div class="col-lg-9" v-if="isshow1">
                        <div class="container">
                            <div class="row">
                                <div class="g-width-100x g-color-gray-dark-v3">
                                    <h2 class="g-font-size-32 g-font-weight-600 g-color-gray-dark-v3">基本信息</h2>
                                    <div class="form-group g-my-20">
<!--                                        <h5 style="font-weight: 400">登录邮箱：<span class="g-color-cyan">{{email}}</span>-->
<!--                                        </h5>-->
                                    </div>
                                    <div class="form-group g-m￿b-20 g-font-size-20">
                                        <h5 style="font-weight: 400">用户名：
                                            <span class="g-color-cyan">{{username}}</span>
                                        </h5>
                                    </div>
                                    <div class="form-group g-m￿b-20 g-font-size-20">
                                        <h5 style="font-weight: 400;margin-bottom: 20px">用户头像&nbsp;&nbsp;(点击更换)：


<!--                                            <input id="file" type="file" @change="shangchuan($event)">-->
                                        </h5>
                                        <div style="display: inline-block">
                                            <el-upload
                                                    :http-request="Upload"
                                                    drag
                                                    action=''
                                                    :data="dataObj"
                                                    class="avatar-uploader"
                                                    :show-file-list="false"
                                                    :on-success="handleAvatarSuccess"
                                                    :before-upload="beforeAvatarUpload">
                                                <img v-if="tempUrl" :src="tempUrl" class="avatar">
                                                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                                            </el-upload>
                                            <el-progress :percentage = progress v-if="progress_show === 'true'"></el-progress>
                                            <div style="margin: 20px 0">
                                                <el-button type="primary" v-if="progress_show==='true'" @click="upload_check" plain>确认上传</el-button>
                                            </div>

                                        </div>


                                    </div>

                                    <div class="g-width-100x u-divider u-divider-solid u-divider-center g-brd-gray-light-v3 g-my-50">
                                        <i class="fa fa-circle u-divider__icon g-bg-white g-color-gray-light-v3" style="font-size: 15px;margin-top: 0.8rem"></i>
                                    </div>
                                </div>

                                <div class="g-width-100x g-color-gray-dark-v3">
                                    <h2 class="g-font-size-32 g-font-weight-600 g-color-gray-dark-v3">更新订阅</h2>
                                    <div class="form-group g-my-20">
                                        <h5 style="font-weight: 400" class="g-font-size-20">当前订阅类型：<span class="g-color-cyan">按月订阅</span>
                                        </h5>
                                    </div>
                                    <div class="form-group g-m￿b-20 g-font-size-20">
                                        <h5 style="font-weight: 400">订阅截止日期：
                                            <span class="g-color-cyan">2019-02-20</span>
                                        </h5>
                                    </div>
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
                                    </div><br>
                                    <div class="g-width-100x">
                                        <button type="button" class="btn u-btn-primary rounded-0 g-py-12 g-px-25" style="float: right">更新订阅</button><br>
                                    </div>


                                    <div class="g-width-100x u-divider u-divider-solid u-divider-center g-brd-gray-light-v3 g-my-50">
                                        <i class="fa fa-circle u-divider__icon g-bg-white g-color-gray-light-v3" style="font-size: 15px;margin-top: 0.8rem"></i>
                                    </div>


                                    <div class="g-width-100x">
                                        <h2 class="h4 g-font-weight-600 g-color-gray-dark-v3 g-font-size-32">更新密码</h2>
                                        <form class="g-color-gray-dark-v3 g-font-size-16">

                                            <div class="form-group g-mb-25 g-font-size-20">
                                                <label>新密码</label>
                                                <input  v-model="new_pwd" type="password" name="password" placeholder="Password" class="form-control form-control-md rounded-0">
                                            </div>
                                            <div class="form-group g-mb-25 g-font-size-20">
                                                <label>确认新密码</label>
                                                <input v-model="new_pwd_confirm" type="password" name="password_confirmation" placeholder="Password" class="form-control form-control-md rounded-0">
                                            </div>
                                            <div class="text-sm-right">
                                                <button type="button" class="btn u-btn-primary rounded-0 g-py-12 g-px-25" @click="updata_pwd()">更新密码</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>



                            </div>
                        </div>
                    </div>

                    <!--               2-->
                    <div class="col-lg-9" v-if="isshow2">
                        <myfavourite></myfavourite>
                    </div>
                    <!--                3-->
                    <div class="col-lg-9" v-if="isshow3">
                        <div class="container">
                            <div class="row">
                                <div class="g-width-100x g-color-gray-dark-v3">
                                    <h2 class="h3 g-color-gray-dark-v3" style="font-weight: 400">基本信息2</h2>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>


    </div>
</template>

<script>
    import  {setCookie,getCookie,delCookie} from  '@/util/cookie'
    import myfavourite from "./myfavourite/myfavourite";
    const OSS = require('ali-oss');
    let client = new OSS({
        region: '阿里云OSS-region',
        accessKeyId: '阿里云OSS-accessKeyId',
        accessKeySecret: '阿里云OSS-accessKeySecret',
        bucket: '阿里云OSS-bucket'
    });
    export default {
        name: "personalspace",
        data(){
            return{
                isshow1:true,
                isshow2:false,
                isshow3:false,
                imageUrl: 'https://vue13.oss-cn-chengdu.aliyuncs.com/myfile/avatar.jpg',
                tempUrl: decodeURIComponent(getCookie('avatar')), //存上传后的图片url
                dataObj: {}, //存签名信息
                baseAli: 'oss-cn-chengdu.aliyuncs.com', //后面连接图片url用的，根据自己aili OSS 配制修改
                progress:0,//进度条
                progress_show:'false',
                username:'',
                email:'',
                news:[],
                newsTotal:'',
                userid:'',
                new_pwd:'',
                new_pwd_confirm:'',





            }
        },
        mounted(){
            this.username = getCookie('username')
            this.userid  = getCookie('userid')
            // //获取邮箱
            // this.$axios.get('http://106.54.23.221:8080/users',{
            //     params:{
            //         id:id,
            //     }
            // })
            //     .then(
            //         res => {
            //             if(this.email ===''){
            //                 this.email = "该用户还没有绑定邮箱"
            //             }else{
            //                 this.email = res.data.data.email
            //             }
            //
            //
            //
            //         })
            //     .catch(
            //         err => {
            //             console.log(err)
            //         }
            //     )
        },
        components:{
          myfavourite,
        },
        methods:{
            addClass:function (event) {
                $('#item1').removeClass('g-bg-red');
                $('#item1').removeClass('g-color-white');
                $('#item2').removeClass('g-bg-red');
                $('#item2').removeClass('g-color-white');
                $('#item3').removeClass('g-bg-red');
                $('#item3').removeClass('g-color-white');
                var el = event.currentTarget;
                $(el).addClass('g-bg-red');
                $(el).addClass('g-color-white');
                let currentID = $(el).attr('id')
                if(currentID === 'item1'){
                    this.isshow1 = true;
                    this.isshow2 = false;
                    this.isshow3 = false;
                }
                if(currentID === 'item2'){
                    this.isshow1 = false;
                    this.isshow2 = true;
                    this.isshow3 = false;
                }
                if(currentID === 'item3'){
                    this.isshow1 = false;
                    this.isshow2 = false;
                    this.isshow3 = true;
                }

            },
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
            handleAvatarSuccess(res, file) {
                this.imageUrl = URL.createObjectURL(file.raw);
            },
            beforeAvatarUpload(file) {
                var typecheck = false;
                if(file.type === 'image/jpeg') typecheck = true;
                if(file.type === 'image/gif') typecheck = true;
                if(file.type === 'image/webp') typecheck = true;
                if(file.type === 'image/png') typecheck = true;
                const isLt2M = file.size / 1024 / 1024 < 2;
                if (!typecheck) {
                    this.$message.error('上传头像图片只能是 JPG、GIF、WEBP、PNG 格式!');
                }
                else if (!isLt2M) {
                    this.$message.error('上传头像图片大小不能超过 2MB!');
                }
                else{

                }
                //

                return typecheck && isLt2M;
            },
            randomInviteCode(){
                $('.invitecodeinput').attr('placeholder','ec84c3dd183b0acc820d5eae474d499d');
                $('.bingo').css('display','');
            },
            chageword(){
                $('.bingo').html('你获得了来自终身会员wuruofeng的邀请。按月订阅将获得20元阅读基金。')
            },
            Upload(file){
                const that = this
                this.progress_show = 'true'
                async function multipartUpload () {
                    const fileName = file.file.uid
                    console.log(fileName)
                    let resulit = client.multipartUpload(fileName.toString(), file.file,
                        {
                            progress:function (p) {
                                console.log(p)
                                that.progress = p*100
                            },
                        })
                        .then(
                        result => {
                            //下面是如果对返回结果再进行处理，根据项目需要
                            //console.log(result)
                            that.tempUrl = 'http://'+result.bucket+'.'+ that.baseAli + '/' + result.name
                            console.log(that.tempUrl)
                            //开始更新
                            //wuruofeng

                        }).catch(err => {
                        console.log("err:",err)
                    })
                }
                 multipartUpload ()
            },
            upload_check(){
                this.$axios.post('http://106.54.23.221:8080/users/update',{
                    avatar:this.tempUrl,
                    id:this.userid,
                    tel:'18890012973'
                })
                    .then(
                        res => {
                            if(res.data.msg === "更新成功"){
                                this.$message({
                                    message: '恭喜你，头像更新成功，请重新登录',
                                    type: 'success'
                                });
                                delCookie('avatar')
                                delCookie('avatar')
                                setCookie('avatar',this.tempUrl)

                            }else{
                                this.$message.error('Ooops...网络好像出了点问题');
                            }
                        })
                    .catch(
                        err => {
                            console.log(err)
                        }
                    )
            },
            updata_pwd(){
                if(!(this.new_pwd ===  this.new_pwd_confirm)){
                    this.$message.error('两次密码输入不一致');
                }else{
                    this.$axios.post('http://106.54.23.221:8080/users/update',{
                        passWord:this.new_pwd,
                        id:this.userid,
                        tel:'18890012973'
                    })
                        .then(
                            res => {
                                if(res.data.msg === "更新成功"){
                                    this.$message({
                                        message: '恭喜你，密码更新成功，请重新登录',
                                        type: 'success'
                                    });
                                }else{
                                    this.$message.error('Ooops...网络好像出了点问题');
                                }
                            })
                        .catch(
                            err => {
                                console.log(err)
                            }
                        )
                }

            },
        }
    }
</script>

<style scoped>
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
        width: 80px;
    }
    .avatar-uploader .el-upload:hover {
        border-color: #409EFF;
    }
    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 178px;
        height: 178px;
        line-height: 178px;
        text-align: center;

    }
    .avatar {
        width: 150px;
        height: 150px;
        border-radius: 150px;
        margin-top: 23px;
        margin-right:10px;
        background-size:cover
    }
    .btn:hover{
        color: white;
    }
    .u-btn-pink:hover{
        background-color: #e81c62ad;
    }

</style>
