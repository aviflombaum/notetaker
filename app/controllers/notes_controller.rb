class NotesController < ApplicationController

  def show
    set_note

    @notebook = Notebook.find_by(params[:notebook_id])
  end

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
    set_note
    @note.destroy
    redirect_to notebooks_path(@notebook)
  end

  private

    def note_params
      params.require(:note).permit(:name, :content, :notebook_id)
    end

    def set_note
      @note = Note.find(params[:id])
    end

end
