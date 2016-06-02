
jquery assessment
1) Must render one show page and one index page via jQuery and an Active Model Serialization JSON Backend. - notebooks/show/index X

2) Must use your Rails api to create a resource and render the response without a page refresh. - notebooks/show X

3) The rails API must reveal at least one has-many relationship in the JSON that is then rendered to the page. notebooks/notes

4) Must have at least one link that loads, or updates a resource without reloading the page. notes/show X and references - next function https://learn.co/tracks/full-stack-web-development/rails-and-javascript/building-apis/returning-strings-lab
resources - next - what happens when the ids for an object are not in order or skip ids?

5) Must translate the JSON responses into Javascript Model Objects. X
The Model Objects must have at least one method on the prototype. Formatters work really well for this. x - notes/show




// this.reference = reference;
//
// // var newNote = '<h4>' + note.name + '</h4><p>' + note.content + '</p>' ;
// $('.notebookNoteSection').append(newNote);
// $('h4:last').addClass('noteName');
// $('p:last').addClass('noteContent');


// $("form").trigger("reset");

$('input[type="submit"]').click( function() {
    var words = $('#name').val().split(' ');
    alert(words.length);
});

// Note.prototype.wordCount = function(){
//   debugger;
//   var wordCount = [];
//   var str = this.content;
//   wordCount = str.split(" ");
//   // add a class for this
//   return "The note is " wordCount.length + " words and " + str.length + " characters."
// }
