class NotebooksController < ApplicationController
  before_action :set_notebook, only: [:show, :edit, :update, :destroy]

  def index
    @notebooks = Notebook.all
  end

  def show
  end

  def new
    @notebook = Notebook.new
    @notebook.notes.build
  end

  def edit
  end

  def create
    @notebook = Notebook.new(notebook_params)
    if @notebook.save
      redirect_to notebook_path(@notebook)
    else
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
