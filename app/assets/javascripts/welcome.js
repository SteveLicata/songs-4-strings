// jQuery / Materialize Carousel
$(document).ready(function(){

  console.log("DOM Loaded");

  // set height onload && window resize
  $(window).on("resize", function () {
    var height = $(window).height();
    // $(".mock-div").css('height', height);
    $('.flex-container').css('height', height - 64);
  }).resize();

  // jQuery sortable function
  $( function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
  });

  // Materialize carousel function
  $('.carousel').carousel();

}); //end Document Ready
