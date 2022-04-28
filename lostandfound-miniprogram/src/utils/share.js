export const shareMixins = {
    data () {
        return {
            shareData: {
                title: '',
                path: '',
                imageUrl: '',
                content: '',
                desc: ''
            }
        }
    },

    //#ifdef MP-WEIXIN

    onShareAppMessage () {
        console.log(this.shareData.path);
        return {
            title: this.shareData.title,
            path: this.shareData.path,
            imageUrl: this.shareData.imageUrl,
            content: this.shareData.content,
            desc: this.shareData.desc,
            success: res => {
                console.info(res)
            }
        }
    },
    //#endif

    onLoad(option) {
    }
}