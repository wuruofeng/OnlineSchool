<template>
    <div>
        <section class="g-bg-gray-light-v5" style="margin-top: 100px">
            <div class="container g-py-100">
                <div class="row justify-content-center">
                    <div class="col-sm-10 col-md-9 col-lg-6">
                        <div class="u-shadow-v21 g-bg-white rounded g-py-50 g-px-30">
                            <header class="text-center mb-4">
                                <h2 class="h2 g-color-black g-font-weight-600">重置登录密码</h2>
                            </header>
                            <div class="g-width-100x">
                                <form method="POST" class="form-control-lg g-px-0">
                                    <div class="form-group g-mb-25">
                                        <label for="email" class="g-color-gray-dark-v4">
                                            <strong>电子邮件</strong>
                                        </label>
                                        <input type="email" name="email" aria-describedby="emailHelp" placeholder="Enter email" class="g-font-size-18 form-control form-control-md rounded-0">
                                    </div>
                                    <button type="submit" class="btn btn-md u-btn-blue rounded-0 g-width-100x">
                                        <strong>重置密码</strong>
                                    </button>
                                </form>
                            </div>
                            <footer class="text-center g-mt-140">
                                <p class="g-color-gray-dark-v5 g-font-size-13 mb-0">已找回密码?
            <a href="#ModelLogin" data-modal-target="#ModelLogin" data-modal-effect="scale" class="g-font-weight-600">点击这里登录</a>
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
    export default {
        name: "resetpwd",
        mounted() {
            this.$emit("dialogVisibleEvent", true);
        }
    }
</script>

<style scoped>
a{
    color:#e6125d;
    outline:0;
}
</style>
