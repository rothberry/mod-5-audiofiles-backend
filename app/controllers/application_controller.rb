class ApplicationController < ActionController::API
 
  def issue_token(user)
    JWT.encode({user_id: user.id}, 't0k3n', 'HS256')
  end

  def current_user
    @user ||= User.find_by(id: user_id)
  end

  def token
    request.headers['Authorization']
  end

  def decoded_token
    begin
      p 'hit decoding'
      JWT.decode(token, 't0k3n', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      [{}]
    end
  end

  def user_id
    decoded_token.first['user_id']
  end

  def logged_in?
    !!current_user
  end
  
end
  
  # before_action :authorized

  # def encode_token(payload)
  #   JWT.encode(payload, 't0k3n')
  # end 

  # def decoded_token
  #   if auth_header
  #     token = auth_header.split(' ')[1]
  #     begin 
  #       JWT.decode(token, 't0k3n', true, algorithm: 'HS256')
  #     rescue JWT::DecodeError
  #       nil 
  #     end
  #   end
  # end

  # def auth_header
  #   request.headers['Authorization']
  # end

  # def current_user
  #   if decoded_token
  #     user_id = decoded_token[0]['user_id']
  #     user = User.find_by(id: user_id)
  #   end
  # end

  # def logged_in? 
  #   p 'auth_loggedin'
  #   !!current_user
  # end

  # def authorized
  #   p 'auth'
  #   render json: {error: 'Please log in'}, status: :unauthorized unless logged_in?
  # end

