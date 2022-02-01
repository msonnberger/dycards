class MultipleChoice < Flashcard
  validates :option1, :option2, :option3, :option4, presence: true
  validates  :option1_correct, :option2_correct, :option3_correct, :option4_correct, inclusion: [true, false]
end
