class SessionsController < ApplicationController
  def new
  end

  def create
    reset_session
    user = User.find_by(username: login_params[:username])

    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to stacks_path
    else
      redirect_to root_path, alert: 'Login failed'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logged out'
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
