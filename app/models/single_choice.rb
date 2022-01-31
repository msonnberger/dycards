class SingleChoice < Flashcard
  validates :option1, :option2, :option3, :option4, :correct_option, presence: true
end
