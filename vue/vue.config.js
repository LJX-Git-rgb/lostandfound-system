module.exports = {
    devServer:{
        open: true,
        port: 8081,
        proxy:{
            '/user': {
                target: 'http://localhost:8082',// 要跨域的域名
                changeOrigin: true, // 是否开启跨域
            },
        }
    }
}