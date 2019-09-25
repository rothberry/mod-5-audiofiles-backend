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

  # DELETE /tags/1
  def destroy
    tag.destroy
    render json: {message: "Tag deleted"}
  end
  
  
  private

  def set_tag
    tag = Tag.find_by(id: params[:id])
  end

  def tag_params
    params.require(:tag)
  end

end
