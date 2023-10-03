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

    if user&.password_digest == session[:auth_key]
      render json: { status: 'SUCCESS', message: 'User Already loggedIn',
                     data: user },
             status: :ok
      return
    end
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:email] = user.email
      session[:name] = user.name
      session[:auth_key] = user.password_digest
      render json: { status: 'SUCCESS', message: 'User logged in successfully',
                     data: user },
             status: :ok
    else
      render json: { status: 'ERROR', message: 'User not able to authenticate',
                     data: user.errors },
             status: :unprocessable_entity
    end
  end

  def logout
    if session[:user_id].nil?
      render json: { status: 'ERROR',
                     message: 'User already Logged Out' }
      return
    end
    session[:user_id] = nil
    session[:email] = nil
    session[:name] = nil
    session[:auth_key] = nil
    render json: { status: 'SUCCESS', message: 'User logged out successfully' },
           status: :ok
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
