$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/notes/" + nextId + ".json", function(data) {
      var note = data["note"];
      $(".noteName").text(note["name"]);
      $(".noteContent").text(note["content"]);
      $(".js-next").attr("data-id", note["id"]);
    });
  });
});
