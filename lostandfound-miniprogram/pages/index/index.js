import { request } from "../../request/index";
Page({
  /**
   * 页面的初始数据
   */
  data: {
    name:"jason",
    galleryImgUrls:[
      "/img/haha.jpeg",
      "/img/haha.jpeg",
      "/img/haha.jpeg",
      "/img/login_backImg.jpeg",
    ],
    indicatorDots: true,  //是否显示面板指示点
    autoplay: true,      //是否自动切换
    interval: 1000,       //自动切换时间间隔
    duration: 500,       //滑动动画时长
    circular: true,
    inputShowed: false,
    inputVal: "",
  },
  search() {
    console.log("gg?",this.goodsInfo)
  },
  getGoodsInfo(){
    request({url:"http://localhost:8082/account/findAll?currentPage=0&pageSize=5"})
    .then(res=>{
      console.log("gg",res.errMsg)
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getGoodsInfo();
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})