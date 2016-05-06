class ReferencesController < ApplicationController
  before_action :authenticate_user!

  def index
    @references = Reference.all
  end

  def new
    @reference = Reference.new
  end

  def create
    @reference = Reference.new(reference_params)
    if @reference.save
      flash[:success] = "Reference created!"
      redirect_to references_path
    else
      flash[:error] = "Could not create reference. Try again"
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
    params.require(:reference).permit(:reference_link, :name)
  end
end
