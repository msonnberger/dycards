class StatsController < ApplicationController
  def index
    completed = current_user.flashcards

    if completed.any?
      counts = completed.group(:type).count
      counts.transform_values!(&:to_f)
      maximum = counts.values.max.to_f

      open_answer = 0
      unless counts['OpenAnswer'].nil? || counts['OpenAnswer'] == 0
        open_answer = 100 / maximum * counts['OpenAnswer']
      end

      multiple_choice = 0
      unless counts['MultipleChoice'].nil? || counts['MultipleChoice'] == 0
        multiple_choice = 100 / maximum * counts['MultipleChoice']
      end

      single_choice = 0
      unless counts['SingleChoice'].nil? || counts['SingleChoice'] == 0
        single_choice = 100 / maximum * counts['SingleChoice']
      end

      true_false = 0
      unless counts['TrueFalse'].nil? || counts['TrueFalse'] == 0
        true_false = 100 / maximum * counts['TrueFalse']
      end


      @stats = {
        total: counts.values.sum,
        open_answer: open_answer,
        multiple_choice: multiple_choice,
        single_choice: single_choice,
        true_false: true_false,
      }

      @stats.transform_values!(&:round)
    end
  end
end
