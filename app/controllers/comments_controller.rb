class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :show, :destroy]

  def index
    comments = Comment.all
    render json: comments
  end
  
  def create
    p '************COMMENT CREATE***********'
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: {errors: comment.errors.full_messages}, status: :not_acceptable
    end
  end

  def update
    if comment.update(comment_params)
      render json: comment, status: :ok
    else
      render json: {error: comment.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
  def destroy
    comment.destroy
    render json: {message: "Comment Deleted"}
  end

  private

  def set_comment
    comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :song_id)
  end

end
