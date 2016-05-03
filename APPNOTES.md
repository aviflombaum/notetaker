REQUIREMENTS - DONE:
1) has_many, a belongs_to, and a has_many :through relationship --DONE
2) models need validations --DONE
3) Nested resource with appropriate urls & Form that relates to the parent resource --DONE
4) Join model needs an additional attribute aside from ids -- DONE
5) Nested form that writes to an associated model through a custom attribute writer. ---NOTEBOOK/TOPIC

REQUIREMENTS - TO DO:
1) At least 1 class level ActiveRecord scope method - report, overdue tasks, most valued cart, etc
2) Standard User authentication - Devise & OmniAuth
3) Forms correctly display validation errors - fields should be enclosed within a fields_with_errors


Associations:
-- A USER has_many NOTEBOOKS // A NOTEBOOK belongs_to a USER
-- A NOTEBOOK has_many NOTES // A NOTE belongs_to a NOTEBOOK
-- A NOTEBOOK has_many TOPICS // A TOPIC has_many NOTEBOOKS *** JOIN TABLE


Routes:
/notebooks
/notebooks/new
/notebooks/:id

/notebooks/:id/notes
/notebooks/:id/notes/new
/notebooks/:id/notes/:id
/notebooks/:id/notes/:id/edit

/notes/new
/notes/:id
/notes/:id/edit



custom attr writer example
def categories_attributes=(categories_hashes)
  categories_hashes.each do |i, category_attributes|
    self.categories.find_or_create_by(name: category_attributes[:name])
  end
end


each notebook has many resources
each resource has many notebooks

each notebook_resource has a topic

make join table like comments
comments join an existing user with an existing post


<%= link_to 'Add a Note', new_notebook_note_path(@notebook, @note), :class => "btn btn-small btn-default" %>

notebooks have many references through notes
references have many references through notes
notes belong to a notebook
notes belong to a reference


2.2.3 :004 > ref.notes.build(name: "note name", content: "note content", notebook_id: nb.id)
2.2.3 :006 > nb.notes.last
2.2.3 :007 > nb.notes.last.reference


Access thing from notes
Comments:
  <% @post.comments.each do |comment| %>
    <%= link_to comment.user.username, user_path(comment.user) %> said
    <%= comment.content %>
  <% end %> ---COMMENT IS THE JOIN TABLE


OMNIAUTH FLOW:

1) the user goes to /auth/facebook on my site
2) omniauth redirects them to fb, providing fb with the key and secret identifying my Application
3) the user logs in with fb
4) fb redirects them back to my app (callback url) and provides my app with a secret code that represents the user on fb
5) my app sends the secret code back to fb
6) fb confirms that the code came from fb and that my app received it
7) fb sends me back the user's data
8) i check if the user existis in my system by email, if so - log them in
9) otherwise, create a user based on their email and log them in
