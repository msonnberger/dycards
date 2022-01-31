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

  def endscreen
    @flashcard = Flashcard.find(params[:id])
    stack = @flashcard.stack
    total_count = stack.flashcards.count.to_f
    @percentages = {}
    @percentages['open_answer'] = OpenAnswer.where(stack_id: stack.id).count / total_count
    @percentages['multiple_choice'] = MultipleChoice.where(stack_id: stack.id).count / total_count
    @percentages['single_choice'] = SingleChoice.where(stack_id: stack.id).count / total_count
    @percentages['true_false'] = TrueFalse.where(stack_id: stack.id).count / total_count
    puts @percentages
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
