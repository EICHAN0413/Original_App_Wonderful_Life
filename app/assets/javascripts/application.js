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



var images = [ 'url("https://user-images.githubusercontent.com/85597833/135962160-9477fe30-c30e-4185-9937-eca244ffe433.jpg")',
               'url("https://user-images.githubusercontent.com/85597833/135963049-2fd69f4a-b69d-4482-b0c4-db8da814cdf4.png")'];
    $(function(){
      var backgroundRandom = function(){
        var number = Math.floor(Math.random() * images.length); 
        var selectedImg = images[number]; 
        $('#randomImg').css('background-image',selectedImg); 
      };
      setInterval(backgroundRandom, 10000);
    });

    