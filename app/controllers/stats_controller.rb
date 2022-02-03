class StatsController < ApplicationController
  def index
    completed = current_user.flashcards
    total = completed.all.count

    if total > 0
      multiple_choice = completed.where(type: 'MultipleChoice').count
      open_answer = completed.where(type: 'OpenAnswer').count
      single_choice = completed.where(type: 'SingleChoice').count
      true_false = completed.where(type: 'TrueFalse').count

      values = Array.[](multiple_choice, open_answer, single_choice, true_false)

      @stats = {
        total: total,
        open_answer: (100 / values.max().to_f * open_answer.to_f).round(),
        multiple_choice: (100 / values.max().to_f * multiple_choice.to_f).round(),
        single_choice: (100 / values.max().to_f * single_choice.to_f).round(),
        true_false: (100 / values.max().to_f * true_false.to_f).round(),
      }
    end
  end
end
