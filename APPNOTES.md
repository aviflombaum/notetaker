REQUIREMENTS:
1) has_many, a belongs_to, and a has_many :through relationship --DONE
2) Join model needs an additional attribute aside from ids
3) models need validations --DONE
4) At least 1 class level ActiveRecord scope method - report, overdue tasks, most valued cart, etc
5) Nested form that writes to an associated model through a custom attribute writer. ---NOTEBOOK/TOPIC
6) Standard User authentication - Devise & OmniAuth
7) Nested resource with appropriate urls & Form that relates to the parent resource --DONE
8) Forms correctly display validation errors - fields should be enclosed within a fields_with_errors


Associations:
-- A USER has_many NOTEBOOKS // A NOTEBOOK belongs_to a USER
-- A NOTEBOOK has_many NOTES // A NOTE belongs_to a NOTEBOOK
-- A NOTEBOOK has_many TOPICS // A TOPIC has_many NOTEBOOKS *** JOIN TABLE


Routes:
/notebooks
/notebooks/new
/notebooks/:id ???

/notebooks/:id/notes
/notebooks/:id/notes/new
/notebooks/:id/notes/:id
/notebooks/:id/notes/:id/edit

/notes/new
/notes/:id
/notes/:id/edit



"notebook"=>{
  "title"=>"field notes",
  "note"=>{
    "content"=>"field notes content"}}
