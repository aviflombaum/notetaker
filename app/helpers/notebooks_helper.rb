module NotebooksHelper
  def display_notebook(note)
    note.notebook.nil? ? link_to("Add Notebook", edit_note_path(note)) : link_to(note.notebook_title, notebook_path(note.notebook))
  end

  def notebook_select(nested, note)
    if nested
      note.notebook.title
    else
      select_tag "note[notebook_id]", options_from_collection_for_select(Notebook.all, :id, :title)
    end
  end
end
