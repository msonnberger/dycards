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

  def next
    @flashcard = Flashcard.find(params[:id])
    current_user.completed_flashcards.create(flashcard_id: @flashcard.id)

    if @flashcard.next
      redirect_to flashcard_path(@flashcard.next)
    else
      endscreen_data
      render 'endscreen'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def endscreen_data
      stack = @flashcard.stack
      total_count = stack.flashcards.count.to_f
      @percentages = {}
      @percentages['open_answer'] = OpenAnswer.where(stack_id: stack.id).count / total_count
      @percentages['multiple_choice'] = MultipleChoice.where(stack_id: stack.id).count / total_count
      @percentages['single_choice'] = SingleChoice.where(stack_id: stack.id).count / total_count
      @percentages['true_false'] = TrueFalse.where(stack_id: stack.id).count / total_count
    end
end
