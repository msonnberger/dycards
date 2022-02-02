class OpenAnswer < Flashcard
  validates :answer, presence: true

  def type_string
    'Offene Frage'
  end
end
