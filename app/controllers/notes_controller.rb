class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def show
    @notebook = Notebook.find_by(params[:notebook_id])
  end

  def new
    @note = Note.new(notebook_id: params[:notebook_id])
  end

  def edit
    if params[:notebook_id]
      @nested = true
      notebook = Notebook.find_by(id: params[:notebook_id])
      if notebook.nil?
        redirect_to notebooks_path, alert: "Notebook not found."
      else
        @note = notebook.notes.find_by(id: params[:id])
        redirect_to notebook_notes_path(notebook), alert: "Note not found." if @note.nil?
      end
    else
      @note = Note.find(params[:id])
    end
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:success] = "Note created!"
      redirect_to @note
    else
      flash[:danger] = "Could not create note. Try again"
      render :new
    end
  end

  def update
    @note.update(note_params)
    if @note.save
      flash[:success] = "Note updated!"
      redirect_to @note
    else
      flash[:danger] = "Could not update note. Try again"
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

    def note_params
      params.require(:note).permit(:name, :content, :notebook_id, :reference_id)
    end

    def set_note
      @note = Note.find(params[:id])
    end

end
