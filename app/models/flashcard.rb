class Flashcard < ApplicationRecord
  belongs_to :stack
  delegate :title, to: :stack, prefix: true
  validates :question, presence: true
  has_many :completed_flashcards, dependent: :destroy

  def next
    Flashcard.where(['id > ? and stack_id = ?', id, stack_id]).first
  end

  def type_symbol
    type_symbol_map = {
      'OpenAnswer' => :open_answer,
      'MultipleChoice' => :multiple_choice,
      'SingleChoice' => :single_choice,
      'TrueFalse' => :true_false
    }

    type_symbol_map[type]
  end
end
