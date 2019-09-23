class Api::V1::AuthController < ApplicationController
#   skip_before_action :authorized, only: [:create, :show]

  # * For the Initial Login Process
  def create
    p "**************************************************"
    user = User.find_by(username: params[:username])
    p user
    if user && user.authenticate(params[:password])
      token = issue_token(user)
      render json: {user: user, jwt: token}, status: :accepted
    else 
      render json: {error: 'Invalid username or password'}, status: :unauthorized
    end
  end

  # * For finding current user on refresh or similar
  def show
    p "*************************************************"
    p params
    p decoded_token
    # p current_user
    # decoded_id = custom_decode(token)[0]["user_id"]
    # decoded_id = decoded_token[0]["user_id"]
    # if decoded_id
    if logged_in?
      # user = User.find_by(id: decoded_id)
      current_user
      render json: {user: user}, status: :accepted
    else
      render json: {error: 'Invalid Token'}, status: :unauthorized
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end
