class TrueFalse < Flashcard
  validates :correct, inclusion: [true, false]

  def type_string
    'Wahr / Falsch'
  end
end
