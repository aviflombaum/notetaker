class ReferencesController < ApplicationController
  before_action :authenticate_user!


  def index
    @references = Reference.all
  end

  def show
    @reference = Reference.find(params[:id])
  end

  def new
    @reference = Reference.new
  end

  def create
    @reference = Reference.new(reference_params)
    if @reference.save
      redirect_to reference_path(@reference)
    else
      render :new
    end
  end

  def destroy
    @reference = Reference.find(params[:id])
    @reference.destroy
    redirect_to references_path(@reference)
  end

  private

  def reference_params
    params.require(:reference).permit(:reference_link)
  end
end
