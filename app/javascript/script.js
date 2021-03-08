$(function(){
  $("#contact-show").on("click", function(){
    $('#contact-modal').fadeIn();
  });

  $(".close-modal").on("click", function(){
   $("#contact-modal").fadeOut();
  });

  $(".faq-list-item").on("click",function(){
    let $answer = $(this).find(".answer");
    if ($answer.hasClass("open")){
      $answer.removeClass("open");
      $answer.slideUp();
      $(this).find("span").text("+");
    }else{
      $answer.addClass("open");
      $answer.slideDown();
      $(this).find("span").text("-")
    }
  });
});
