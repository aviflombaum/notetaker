class NotebooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notebook, only: [:show, :edit, :update, :destroy]

  def index
    @notebooks = Notebook.all
  end

  def show
  end

  def new
    @notebook = Notebook.new
    @note = @notebook.notes.build
  end

  def edit
  end

  def create
    @notebook = Notebook.new(notebook_params)
    @notebook.user_id = current_user.id
    if @notebook.save
      flash[:success] = "Notebook created!"
      redirect_to notebook_path(@notebook)
    else
      flash[:error] = "Could not create Notebook. Try again"
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
