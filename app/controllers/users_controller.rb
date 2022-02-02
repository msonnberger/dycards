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

  def show
  end

  def destroy
    current_user.destroy
    redirect_to logout_path
  end

  def edit
  end

  def update
    if edit_params[:new_password].empty?
      if current_user.update(username: edit_params[:username])
        redirect_to user_path(current_user)
      else
        redirect_to edit_user_path(current_user)
      end
    else
      if current_user.authenticate(edit_params[:password])
        if current_user.update(password: edit_params[:new_password], password_confirmation: edit_params[:new_password_confirmation])
          redirect_to user_path(current_user)
        else
          redirect_to edit_user_path(current_user)
        end
      end
    end
  end

  private
    def signup_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def edit_params
      params.require(:user).permit(:username, :password, :new_password, :new_password_confirmation)
    end
end
