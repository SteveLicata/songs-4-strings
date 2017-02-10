// jQuery / Materialize Carousel
$(document).on('turbolinks:load',function(){

  console.log("DOM Loaded");

  // set height onload && window resize for flexbox homepage image
  $(window).on("resize", function () {
    var height = $(window).height();
    // $(".mock-div").css('height', height);
    $('.flex-container').css('height', height - 64);
  }).resize();

  // jQuery sortable function for setlists
  $( function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
  });

  // Materialize carousel function for homepage
  $('.carousel').carousel();

  //Navbar
  $(".button-collapse").sideNav();


}); //end Document Ready
