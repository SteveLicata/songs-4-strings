// jQuery / Materialize Carousel
$(document).ready(function(){
     $('.carousel').carousel('next');
      // dist:-100;
      // shift:100;
      // duration:1000;
      var imageArray = [
        "/assets/acoustic2.jpg",
        "/assets/sheetmusic2.jpg",
        "/assets/acoustic3.jpg",
        "/assets/piano1.jpg",
        "/assets/acoustic4.jpg"
      ]

      var welcomeImage = document.getElementById('welcomeimage');

      if (welcomeImage !== null) {
        console.log("images");

        var i = 0
        setInterval(function(){
          if (i == imageArray.length) {
            i = 0
          }
          welcomeImage.src = imageArray[i];
          i++;
        }, 3000);
      };
   });
