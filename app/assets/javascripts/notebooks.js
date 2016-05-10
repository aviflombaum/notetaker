$(document).ready(function() {
    $('#myrefs').click(function() {
       $('.refs').toggle();
    });

    $('#allrefs').click(function() {
      $('.allrefs').toggle();
    });

    $('.show').click(function() {
       $('.notebook-details').toggle();
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



  $('.all-references-top').on('click', function() {
	$parent_box = $(this).closest('.all-references');
	$parent_box.siblings().find('.all-references-bottom').hide();
	$parent_box.find('.all-references-bottom').toggle();
});

$('.my-references-top').on('click', function() {
$parent_box = $(this).closest('.my-references');
$parent_box.siblings().find('.my-references-bottom').hide();
$parent_box.find('.my-references-bottom').toggle();
});


});



//   $('.top').on('click', function() {
// 	$parent_box = $(this).closest('.box');
// 	$parent_box.siblings().find('.bottom').hide();
// 	$parent_box.find('.bottom').toggle();
// });
