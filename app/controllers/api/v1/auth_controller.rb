class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
      @user = User.find_by(email: user_login_params[:email])
      if @user && @user.authenticate(user_login_params[:password])
          #.authenticate from BCrypt
          token = encode_token({ user_id: @user.id })
          render json: { user: @user.to_json(only: [:username, :email, :id]), jwt: token }, status: :accepted
      else
          render json: {message: "Invalid email or password"}, status: :unauthorized
      end   
  end

  private

  def user_login_params
      params.require(:user).permit(:email, :password)
  end

end