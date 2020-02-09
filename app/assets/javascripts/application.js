//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery/dist/jquery.js
//= require_tree .

$( document ).ready(function() {
  $('#notice').fadeOut(2000);
});


$(function() {
    $('.a').slick({
      accessibility: true,
      autoplay: true,
      autoplaySpeed: 2000,
      dots: true,
      fade: true,
    });
});
