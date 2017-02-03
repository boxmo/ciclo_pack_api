class AuthController < ApplicationController

  def login
    @user = User.find_by(email: params[:email])
    if @user
      if @user.password == params[:password]
        render json: @user
      else
        render json: {message: "Email e senha não conferem"}, status: 401
      end
    else
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: 201
      else
        render json: {  message: @user.errors.messages }, status: 401
      end
    end
  end


  private

  def user_params
    {
      name: params[:name],
      email: params[:email],
      password: params[:password]
    }
  end
end
