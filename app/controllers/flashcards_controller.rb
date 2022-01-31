class FlashcardsController < ApplicationController
  def index
    @stack = Stack.find(params[:stack_id])
    @flashcards = @stack.flashcards
  end

  def new
  end

  def create
  end

  def show
    @flashcard = Flashcard.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
