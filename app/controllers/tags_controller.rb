class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    @tag.save
  end

  private

    def tag_params
      params.require(:tag).permti(:name)
    end
end
