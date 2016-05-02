class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @notebook = Notebook.find_by(params[:notebook_id])
    @note = @notebook.notes.build(note_params)
    if @note.save
      redirect_to notebook_path(@notebook)
    else
      render "notebooks/show"
    end
  end

  def destroy
    @note.destroy
    redirect_to notebooks_path(@notebook)
  end

  private

    def note_params
      params.require(:note).permit(:content, :notebook_id)
    end

    def set_note
      @note = Note.find(params[:id])
    end

end
