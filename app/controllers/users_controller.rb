class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to stacks_path
    else
      redirect_to signup_path, alert: 'Sign Up failed'
    end
  end

  private

  def signup_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
