//menu
$(document).ready(function(){
  if($(window).width()>768){
  $('li.mainlevel').mousemove(function(){
  $(this).find('ul').slideDown();//you can give it a speed
	$(this).find('a.menu').addClass("cur");
  });
  $('li.mainlevel').mouseleave(function(){
  $(this).find('ul').slideUp("slow");
	$(this).find('a.menu').removeClass("cur");
  });
  };
  
   $(".about-team").on("click", "span", function () {
            var nIndex = $(".about-team-title span").index(this)+1;
            $('body,html').animate({ scrollTop: $(".cont-"+nIndex).offset().top }, 1000);

        })
  
     $(".contact").on("click", "li", function () {
            var nIndex = $(".contact-side ul li").index(this)+1;
            $('body,html').animate({ scrollTop: $(".c-cont-"+nIndex).offset().top }, 1000);

        })
  
      $(".phone-nav").toggle(function(){
         $(".nav").slideDown('slow');
       },function(){
         $(".nav").slideUp('slow');
       });
  
  
});

//