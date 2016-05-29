// next button
$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/references/" + nextId + ".json", function(data) {
      var reference = data["reference"];
      $(".referenceName").text(reference["name"]);
      $(".js-next").attr("data-id", reference["id"]);
    });
  });
});
