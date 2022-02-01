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
    @stack = current_user.stacks.new(title: params[:title])

    if @stack.save
      render plain: stack_path(@stack)
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    stack = Stack.find(params[:id])
    if stack.destroy
      redirect_to stacks_path
    end
  end

  private
    def require_login
      unless current_user
        redirect_to login_path
      end
    end
end
