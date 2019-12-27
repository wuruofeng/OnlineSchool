<template>
    <div>
        <div class="g-bg-blue-lineargradient-v5 g-z-index-1" style="margin-top: 100px">
            <div class="container u-bg-overlay__inner g-py-100">
                <div class="row align-items-center">
                    <div class="col-12 text-center">
                        <h2 class="h1 g-color-white g-font-weight-700 g-mb-20">
                            <strong>Hi, 喜欢你来</strong>
                        </h2>
                        <i class="fa fa-heart g-color-primary" ></i>
                        <p class="g-px-100 g-mt-15 g-font-size-20 g-color-white">
                            <strong>随处观看，随时退款</strong>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <JoinUsComponent style="margin-top: 20px"></JoinUsComponent>
    </div>
</template>

<script>
    import JoinUsComponent from "../joinus/JoinUsComponent";
    export default {
        name: "join",
        components: {JoinUsComponent},
        mounted(){
            this.$emit("dialogVisibleEvent", true);
        },
        methods:{

        },
    }
</script>

<style scoped>

</style>
