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
       $('.noteContent').toggle();
    });

    $(".panel").hover(function(){
      $(this).addClass("panelHover")
    }, function(){
      $(this).removeClass("panelHover")

    }
  );

});
