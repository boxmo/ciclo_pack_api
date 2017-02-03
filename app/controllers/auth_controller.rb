class AuthController < ApplicationController

  def login
    @auth = false
    @user = User.find_by(email: params[:email])
    @auth = true if @user && @user.password == params[:password]

    if @auth
      render json: @user, status: :ok
    else
      render json: {message: "Email e senha não conferem"}, status: 401
    end
  end



  def signup
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: {  message: @user.errors.messages }, status: 401
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
