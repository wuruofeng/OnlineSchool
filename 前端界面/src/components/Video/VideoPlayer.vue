<template>
    <div>
        <video ref="videoPlayer" class="video-js vjs-flat-skin  vjs-show-big-play-button-on-pause vjs-big-play-centered vjs-fluid">

        </video>
    </div>
</template>

<script>
    // import videojs from 'video.js';

    export default {
        name: "VideoPlayer",
        props: {
            options: {
                type: Object,
                default() {
                    return {};
                }
            },
        },
        data() {
            return {
                player: null
            }
        },
        mounted() {
            const that = this
            this.player = videojs(this.$refs.videoPlayer, this.options, function onPlayerReady() {
                console.log('onPlayerReady');
            })
        },
        beforeDestroy() {
            if (this.player) {
                this.player.dispose()
            }
        }
    }
</script>

<style scoped>
@import "css/video-js.css";
@import "css/videojs-flat-skin.css";

</style>
