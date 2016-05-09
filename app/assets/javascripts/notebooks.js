$(document).ready(function() {
    $('#myrefs').click(function() {
       $('.refs').toggle("slide");
    });

    $('#allrefs').click(function() {
      $('.allrefs').toggle("slide");
    });

    $('.show').click(function() {
       $('.notebook-details').toggle("slide");
    });

    $('.noteName').click(function() {
       $('.noteContent').fadeToggle();
    });

    $(".panel").hover(function(){
      $(this).css("background-color", "#FAFAFA");
      $(this).css("color", "white")
    }, function(){
      $(this).css("background-color", "white");
      $(this).css("color", "#9E9E9E")

    }
  );

});
