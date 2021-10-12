document.addEventListener("turbolinks:load", function() {
  $('.tab li').on('click', function(){
    $('.tab li').removeClass('select');
    $(this).addClass('select');

    $('.container_template li').addClass('container_free');
    let index = $('.container_template li').index($(this));
    $('.container_template li').eq(index).removeClass('container_free');
  });
});