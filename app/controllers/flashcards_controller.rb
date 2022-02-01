class FlashcardsController < ApplicationController
  def index
    @stack = Stack.find(params[:stack_id])
    @flashcards = @stack.flashcards
  end

  def new
    @stack = Stack.find(params[:stack_id])
  end

  def create
    @stack = Stack.find(params[:stack_id])
    @flashcard = @stack.flashcards.new(question: params[:question], type: params[:type], answer: params[:answer])

    if @flashcard.save
      render partial: 'flashcard_created'
    else
      render 'new'
    end
  end

  def show
    @flashcard = Flashcard.find(params[:id])
    if !session[:open_answer]
      session[:open_answer] = 0
      session[:multiple_choice] = 0
      session[:single_choice] = 0
      session[:true_false] = 0
    end
  end

  def next
    @flashcard = Flashcard.find(params[:id])
    current_user.completed_flashcards.create(flashcard_id: @flashcard.id)

    types = {
      'OpenAnswer' => :open_answer,
      'MultipleChoice' => :multiple_choice,
      'SingleChoice' => :single_choice,
      'TrueFalse' => :true_false
    }

    session[types[@flashcard.type]] += 1 if params[:correct] == 'true'

    if @flashcard.next
      redirect_to stack_flashcard_path(@flashcard.stack, @flashcard.next)
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

  def flashcard_params
    params.permit :id, :stack_id, :correct
  end

  helper_method :flashcard_params

  private
    def endscreen_data
      stack = @flashcard.stack
      open_answer_count = stack.flashcards.where(type: 'OpenAnswer').count.to_f
      multiple_choice_count = stack.flashcards.where(type: 'MultipleChoice').count.to_f
      single_choice_count = stack.flashcards.where(type: 'SingleChoice').count.to_f
      true_false_count = stack.flashcards.where(type: 'TrueFalse').count.to_f

      @percentages = {
        open_answer: session[:open_answer] / open_answer_count * 100,
        multiple_choice: session[:multiple_choice] / multiple_choice_count * 100,
        single_choice: session[:single_choice] / single_choice_count * 100,
        true_false: session[:true_false] / true_false_count * 100,
      }
    end
end
