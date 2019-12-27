const webpack = require("webpack");

module.exports = {

    configureWebpack: {
        plugins: [
            new webpack.ProvidePlugin({
                $: 'jquery',
                jQuery: 'jquery',
                'window.jQuery': 'jquery',
                Popper: ['popper.js', 'default']
            })
        ],
        externals:{
            'vue': 'Vue',
            'vue-router': 'VueRouter',
            'vuex':'Vuex',
            'element-ui':'ElementUI',
            'swiper':'Swiper',
            'axios':'axios',
            'video.js':'Video',
            'vue-i18n':'VueI18n',
            // 'vee-validate':'ValidationProvider',
            // 'vee-validate':'extend',
            // 'vee-validate':'localize',
        },
    },
    publicPath:'/',
    devServer: {
        proxy: {
            '/api': {
                target: 'http://localhost:8080',
                pathRewrite: {
                    '^/api': 'static/mock'
                }
            },
            '/loginapi':{
                target: 'http://106.54.23.221:8080/mylogin',
                changeOrigin: true,
                pathRewrite: {
                    '^/loginapi': ''
                }
            },
            '/registerapi':{
                target: 'http://106.54.23.221:8080/register/',
                changeOrigin: true,
                pathRewrite: {
                    '^/registerapi': ''
                }
            },
            '/getallterm':{
                target: 'http://106.54.23.221:8080/term/',
                changeOrigin: true,
            },
        },
    }
}
