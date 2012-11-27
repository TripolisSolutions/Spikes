// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready( function() {
    var ac = $('.collapse');
    ac.on('show', function(event){
        var $headerElement = $(this).prev();
        $headerElement.addClass('active');
        $headerElement.find('.icon-white').toggleClass('icon-plus icon-minus')
    })
    ac.on('hide', function(event){
        var $headerElement = $(this).prev();
        $headerElement.removeClass('active');
        $headerElement.find('.icon-white').toggleClass('icon-minus icon-plus')
    });
    $('.accordion-heading > a').hover(function(){
        $(this).parent().toggleClass('ac-hover');
    })

});