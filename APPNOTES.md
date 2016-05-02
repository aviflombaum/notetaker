REQUIREMENTS - DONE:
1) has_many, a belongs_to, and a has_many :through relationship --DONE
2) models need validations --DONE
3) Nested resource with appropriate urls & Form that relates to the parent resource --DONE

REQUIREMENTS - TO DO:
1) Join model needs an additional attribute aside from ids
2) At least 1 class level ActiveRecord scope method - report, overdue tasks, most valued cart, etc
3) Nested form that writes to an associated model through a custom attribute writer. ---NOTEBOOK/TOPIC
4) Standard User authentication - Devise & OmniAuth
5) Forms correctly display validation errors - fields should be enclosed within a fields_with_errors


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
