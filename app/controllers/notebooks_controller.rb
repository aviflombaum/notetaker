class NotebooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notebook, only: [:show, :edit, :update, :destroy]


  def index
    @notebooks = Notebook.by_user(current_user)
    @references = Reference.all
    @my_refs = Reference.by_user(current_user)
    respond_to do |format|
      format.html {render :index}
      format.json { render json: @notebooks}
    end
  end

  def show
    @note = Note.new
  end

  def new
    @notebook = Notebook.new
    @note = @notebook.notes.build
  end

  def edit
    if @notebook.user_id != current_user.id
      redirect_to notebooks_path, alert: "You are not the owner of this notebook."
    end
  end

  def create
    @notebook = Notebook.new(notebook_params)
    @notebook.user_id = current_user.id
    if @notebook.save
      flash[:success] = "Notebook created!"
      redirect_to notebook_path(@notebook)
    else
      flash[:danger] = "Could not create Notebook. Try again"
      render :new
    end
  end

  def update
    if @notebook.update(notebook_params)
      redirect_to notebook_path(@notebook)
    else
      render :edit
    end
  end

    def destroy
      if @notebook.user_id != current_user.id
        redirect_to notebooks_path, alert: "You are not the owner of this notebook."
      end
      @notebook.destroy
      redirect_to notebooks_path
    end

    private

      def notebook_params
        params.require(:notebook).permit(:title, notes_attributes: [:id, :name, :content])
      end

      def set_notebook
        @notebook = Notebook.find(params[:id])
      end
end
