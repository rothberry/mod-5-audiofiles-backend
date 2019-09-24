class TagsController < ApplicationController

  def index
    tags = Tag.all
    render json: tags, include: [:songs]
  end

  def show
    set_tag
  end
  
  def create
    tag = Tag.new(tag_params)
    if tag.save
      render json: tag, status: :created
    else
      render json: {errors: tag.errors.full_messages}, status: :not_acceptable
    end
  end

  private

  def set_tag
    tag = Tag.find_by(id: params[:id])
  end

  def tag_params
    params.require(:tag)
  end

end
