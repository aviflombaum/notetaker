$(function () {
  $(".js-next").on("click", function() {
    var nextId = ; // get id from @next_note
    $.get("/notes/" + nextId + ".json", function(data) {
      var note = data["note"];
      $(".noteName").text(note["name"]);
      $(".noteContent").text(note["content"]);
      $(".js-next").attr("data-id", note["id"]);
    });
  });
});
