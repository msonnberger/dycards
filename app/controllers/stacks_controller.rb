class StacksController < ApplicationController
  before_action :require_login

  def index
    @stacks = current_user.stacks
  end

  def show
    @stack = Stack.find(params[:id])
    @flashcards = @stack.flashcards
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def require_login
    unless current_user
      redirect_to login_path
    end
  end
end
