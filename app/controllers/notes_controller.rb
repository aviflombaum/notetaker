class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy] #add edit


  def show
      @notebook = Notebook.find_by(params[:notebook_id])
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @notebook = Notebook.find_by(params[:notebook_id])
    @note = @notebook.notes.build(note_params)
    if @note.save
      redirect_to notebook_path(@notebook)
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      redirect_to note_path(@note)
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notebooks_path(@notebook)
  end

  private

    def note_params
      params.require(:note).permit(:name, :content, :notebook_id, :reference_id)
    end

    def set_note
      @note = Note.find(params[:id])
    end

end
