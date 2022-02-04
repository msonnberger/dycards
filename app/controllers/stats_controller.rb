class StatsController < ApplicationController
  def index
    completed = current_user.flashcards

    if completed.any?
      counts = completed.group(:type).count
      counts.transform_values!(&:to_f)
      maximum = counts.values.max.to_f

      @stats = {
        total: counts.values.sum,
        open_answer: 100 / maximum * counts['OpenAnswer'],
        multiple_choice: 100 / maximum * counts['MultipleChoice'],
        single_choice: 100 / maximum * counts['SingleChoice'],
        true_false: 100 / maximum * counts['TrueFalse'],
      }

      @stats.transform_values!(&:round)
    end
  end
end
