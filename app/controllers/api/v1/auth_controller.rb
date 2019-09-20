class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    p "**************************************************"
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, jwt: token}, status: :accepted
    else 
      render json: {error: 'Invalid username or password'}, status: :unauthorized
    end
  end

  def show
    p "*************************************************"
    token = params[:token]
    decoded_id = custom_decode(token)[0]["user_id"]
    if decoded_id
      user = User.find_by(id: decoded_id)
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
