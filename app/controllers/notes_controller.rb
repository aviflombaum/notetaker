class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
    respond_to do |format|
      format.html {render :index}
      format.json { render json: @notes}
    end
  end

   def show
     @next_note = Note.next_note
     binding.pry
     respond_to do |format|
       format.html { render :show }
       format.json { render json: @note }
     end
   end

   def next
     binding.pry
    #  @next_note = Note.find_next(@note)
     @next_note = Note.next_note
   end
   def body
     note = Note.find(params[:id])
     render plain: note.content
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
    @note = Note.create(note_params)
    render json: @note, status: 201

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
      params.require(:note).permit(:name, :content, :notebook_id, :reference_id, tag_ids:[], tags_attributes: [:name])
    end

    def set_note
      @note = Note.find(params[:id])
    end

end
