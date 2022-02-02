class StatsController < ApplicationController
  def index
    completed = current_user.flashcards
    total = completed.all.count

    if total > 0
      @stats = {
        total: total,
        multiple_choice: completed.where(type: 'MultipleChoice').count / total.to_f * 100,
        open_answer: completed.where(type: 'OpenAnswer').count / total.to_f * 100,
        single_choice: completed.where(type: 'SingleChoice').count / total.to_f * 100,
        true_false: completed.where(type: 'TrueFalse').count / total.to_f * 100,
      }
    end
  end
end
