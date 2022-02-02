class TrueFalse < Flashcard
  validates :correct, inclusion: [true, false]
end
