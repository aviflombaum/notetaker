class NotesController < ApplicationController
  def create
    @notebook = Notebook.find(params[:notebook_id])
    @note = @notebook.notes.build(note_params)
    if @note.save
      redirect_to notebook_path(@ntoebook)
    else
      render "notebooks/show"
    end
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end

end
