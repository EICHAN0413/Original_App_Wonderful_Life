// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery/dist/jquery.js
//= require popper.js/dist/umd/popper.js
//= require bootstrap/dist/js/bootstrap.min
//= require_tree .
//= require cocoon

$(document).on('turbolinks:load', function() {
  $(function() {
    $('.tab').click(function(){
      $('.tab-active').removeClass('tab-active');
      $(this).addClass('tab-active');
      $('.box-show').removeClass('box-show');
      const index = $(this).index();
      $('.tabbox').eq(index).addClass('box-show');
    });
  });
});

document.addEventListener("turbolinks:load", function() {
  $('textarea').autosize();
});

function previewImage(id) {
  const target = this.event.target;   
  const file = target.files[0];       
  const reader = new FileReader();     
  reader.onloadend = function() {     
    preview.src = reader.result;       
  };
  if (file) {
    reader.readAsDataURL(file);     
  } else {
    preview.src = "";
  }
}

var images = [ 'url("https://user-images.githubusercontent.com/85597833/137056833-ca67b7bf-3f9c-401a-a5ce-05d551cb72b8.jpg")',
                'url("https://user-images.githubusercontent.com/85597833/137056433-6966b7cf-2881-4bf4-bf74-bbe15b3c12a0.jpg")',
                'url("https://user-images.githubusercontent.com/85597833/137056550-98933249-8322-4084-8761-d655a5390d2b.jpg")',
                'url("https://user-images.githubusercontent.com/85597833/138859914-c0cf3062-d5f7-4b7f-aed2-42a160e7b97b.jpg")',
                'url("https://user-images.githubusercontent.com/85597833/138859993-94efc6e0-e710-4bd4-8d14-c6a5ebf54446.jpg")',
                'url("https://user-images.githubusercontent.com/85597833/138860148-1af99e5e-9f95-44d6-9b2c-6508c002502b.jpg")',
                'url("https://user-images.githubusercontent.com/85597833/138860236-a0fca756-c68f-4649-b18b-9ef7983e4757.jpg")',
                'url("https://user-images.githubusercontent.com/85597833/138860320-fd4963ae-63a7-446b-8811-0718033846d0.jpg")',
                'url("https://user-images.githubusercontent.com/85597833/138860394-a7e0098f-3f5f-4374-97b8-2836b5cfa194.jpg")',
                'url("https://user-images.githubusercontent.com/85597833/138860517-701d5519-de3e-4819-a194-f8f98ae306d8.jpg")',
                'url("https://user-images.githubusercontent.com/85597833/137056608-b1237eef-4f33-4dd3-a305-b4e4af24bcb7.jpg")'];
    $(function(){
      var backgroundRandom = function(){
        var number = Math.floor(Math.random() * images.length); 
        var selectedImg = images[number]; 
        $('#randomImg').css('background-image',selectedImg);
      };
      setInterval(backgroundRandom, 5000);
    });

  