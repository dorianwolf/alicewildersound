// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {
  initPage();
});
$(window).bind('page:change', function() {
  initPage();
});
function initPage() {

  // Overline animation and text and menu display
  if($('.header-info').length){

    // Menu display
    if($('.menu-item').length){
      $('.current_page').removeClass('current_page');
      var page = '.'+$('.header-info').data('page');
      var menu_item = $(page);
      menu_item.addClass('current_page');
    }

    // Overline animation and text
    var text = $('.header-info').data('text');
    var header = $('.audio-engineer');
    if(header.html().indexOf(text) == -1){
      if(header.html().indexOf('Logout') == -1){
        header.append(text);
      }
    }
    $('.overline').animate({
      width: $('.audio-engineer').width()-4
  	}, 2000);
  } else {
    var header = $('.audio-engineer');
    if(header.html().indexOf('Logout') == -1){
      header.append('audio-engineer');
    }
    $('.overline').animate({
      width: $('.audio-engineer').width()-4
  	}, 2000);
  }

  // Menu shows current page


};
