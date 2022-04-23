module.exports = {
    devServer: {
        open: true,
        port: 8081,
        proxy: {
            '/api': {
                target: 'http://localhost:8082',
                ws: true,
                changOrigin: true, //允许跨域
                pathRewrite: {
                    '^/api': '/' //请求的时候使用这个api就可以
                }
            }
        }
    }
}