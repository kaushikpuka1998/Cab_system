class UserController < ApplicationController
  def create_user
    user = User.new(user_params)
    if user.save
      render json: { status: 'SUCCESS', message: 'Saved user' }, status: :ok
    else
      render json: { status: 'ERROR', message: 'User not created', data: user.errors },
             status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by_email(params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:email] = user.email
      session[:name] = user.name
      render json: { status: 'SUCCESS', message: 'User logged in successfully', data: user },
             status: :ok
    else
      render json: { status: 'ERROR', message: 'User not able to authenticate', data: user.errors },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
