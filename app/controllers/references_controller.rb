class ReferencesController < ApplicationController
  before_action :authenticate_user!

  def index
    @references = Reference.all
    @reference = Reference.new
  end

  def show
    @reference = Reference.find(params[:id])
    @next_reference = Reference.find_by_sql("SELECT * FROM references where id > @reference LIMIT 1")


    respond_to do |format|
      format.html {render :show}
      format.json {render json: @reference }
      # format.json {render json: @reference.to_json }
    end
  end


  # def next  # /resources/next
  #   @next_reference = Reference.find_next(@reference)
  #
  # end

  def new
    @reference = Reference.new
  end

  def create
    @reference = Reference.create(reference_params)
    @reference.user_id = current_user.id
    @reference.save
    render json: @reference, status: 201
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
