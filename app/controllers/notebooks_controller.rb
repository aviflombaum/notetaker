class NotebooksController < ApplicationController
  before_action :set_notebook, only: [:show, :edit, :update]
  def show
  end

  def new
    @notebook = Notebook.new
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

  private

  def notebook_params
    params.require(:notebook).permit(:title)
  end

  def set_notebook
    @notebook = Notebook.find(params[:id])
  end
end
