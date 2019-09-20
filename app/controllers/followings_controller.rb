class FollowingsController < ApplicationController
  def index
    @active_relationships = current_user.active_relationships
    @passive_relationships = current_user.passive_relationships
    render json: {active_relationships: @active_relationships, passive_relationships: @passive_relationships}
  end

  def create
    # Current User is about  to follow the 'followed_user'
    @followed_user = User.find_by(id: params[:following][:followed_id])
    @relationship = current_user.active_relationships.new(followed_id: @followed_user.id)
    if @relationship.save
      render json: @relationship, status: :created
    else
      render json: {error: 'Relationship not created'}, status: :not_acceptable
    end
  end

  def destroy
    @relationship = Following.find(params[:id])
    if @relationship.follower_user == current_user
      @relationship.destroy
      render json: {message: 'Relationship deleted'}
    else
      render json: {error: 'Relationship not deleted'}
    end
  end
  
end