class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # skip_before_action :authorized, only: [:create, :index]
  
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def create
    p '#########################################'
    # user = User.new(user_params)
    user = User.new(
      username: params[:username],
      name: params[:name],
      password: params[:password],
      location: params[:location],
      bio: params[:bio],
      img_url: params[:img_url],
      facebook_url: params[:facebook_url],
      twitter_url: params[:twitter_url],
      soundcloud_url: params[:soundcloud_url]
    )
    if user.save
      token = issue_token(user)
      render json: {user: user, jwt: token}, status: :created
    else
      render json: {error: user.errors.full_messages}, status: :not_acceptable
    end
  end

  def update
    if user.update(user_params)
      render json: user, status: :ok
    else
      render json: {error: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    user.destroy
    render json: {message: "User Deleted"}
  end

  private

  def set_user
    user = User.find_by(id: params[:id])
  end
  
  def user_params
    params.require(:user)
  end
  
end
