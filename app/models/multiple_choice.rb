class MultipleChoice < Flashcard
  validates(
    :option1, 
    :option2, 
    :option3, 
    :option4, 
    :option1_correct, 
    :option2_correct, 
    :option3_correct, 
    :option4_correct,
    presence: true
  )
end
