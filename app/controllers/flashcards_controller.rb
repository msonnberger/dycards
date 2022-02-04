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
    @flashcard = @stack.flashcards.new(new_flashcard_params)

    if @flashcard.save
      render partial: 'flashcard_created', locals: { stack: @stack }
    else
      render 'new', alert: 'Flashcard konnte nicht erstellt werden.'
    end
  end

  def edit
    @flashcard = Flashcard.find(params[:id])
  end

  def update
    @flashcard = Flashcard.find(params[:id])

    if @flashcard.update(new_flashcard_params)
      render plain: stack_path(@flashcard.stack)
    else
      render plain: edit_stack_flashcard_path(@flashcard.stack, @flashcard), alert: 'Flashcard konnte nicht gespeichert werden'
    end
  end

  def destroy
    @flashcard = Flashcard.find(params[:id])
    @flashcard.destroy
    redirect_to stack_path(@flashcard.stack)
  end

  def show
    @flashcard = Flashcard.find(params[:id])
    if @flashcard == @flashcard.stack.flashcards.first
      session[:open_answer] = 0
      session[:multiple_choice] = 0
      session[:single_choice] = 0
      session[:true_false] = 0
    end
  end

  def next
    @flashcard = Flashcard.find(params[:id])
    current_user.completed_flashcards.create(flashcard_id: @flashcard.id)
    session[@flashcard.type_symbol] += 1 if params[:correct] == 'true'
    next_card = @flashcard.next

    if next_card
      redirect_to stack_flashcard_path(@flashcard.stack, next_card)
    else
      endscreen_data
      render 'endscreen'
    end
  end

  def flashcard_params
    params.permit :id, :stack_id, :correct
  end

  helper_method :flashcard_params

  private
    def endscreen_data
      stack = @flashcard.stack
      counts = stack.flashcards.group(:type).count
      counts.transform_values!(&:to_f)

      open_answer = 0
      unless counts['OpenAnswer'].nil? || counts['OpenAnswer'] == 0
        open_answer = session[:open_answer] / counts['OpenAnswer'] * 100
      end

      multiple_choice = 0
      unless counts['MultipleChoice'].nil? || counts['MultipleChoice'] == 0
        multiple_choice = session[:multiple_choice] / counts['MultipleChoice'] * 100
      end

      single_choice = 0
      unless counts['SingleChoice'].nil? || counts['SingleChoice'] == 0
        single_choice = session[:single_choice] / counts['SingleChoice'] * 100
      end

      true_false = 0
      unless counts['TrueFalse'].nil? || counts['TrueFalse'] == 0
        true_false = session[:true_false] / counts['TrueFalse'] * 100
      end

      @percentages = {
        open_answer: open_answer,
        multiple_choice: multiple_choice,
        single_choice: single_choice,
        true_false: true_false,
      }
    end

    def new_flashcard_params
      params.require(:flashcard).permit(
        :question,
        :notes,
        :type,
        :answer,
        :option1,
        :option2,
        :option3,
        :option4,
        :option1_correct,
        :option2_correct,
        :option3_correct,
        :option4_correct,
        :correct_option,
        :correct,
        :stack_id
      )
    end
end
