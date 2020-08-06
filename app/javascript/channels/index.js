// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

$(function(){

  //ハンバーガーメニュー
  $(".navbar-burger").on("click",function(){
      $(".navbar-burger").toggleClass("is-active");
      $(".navbar-menu").toggleClass("is-active");
  });

  //ドロップダウン
  if(isPC){
      //PCではBulmaのcssの動きで開閉します
  }else{
      $(".has-dropdown").on("click",function(){
          var $this = $(this);
          $this.toggleClass("is-active");
          $this.find(".navbar-dropdown").slideToggle();
      });
      $(".has-dropdown .navbar-dropdown").hide();
  }
});