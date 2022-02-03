class Flashcard < ApplicationRecord
  belongs_to :stack
  validates :question, presence: true
  has_many :completed_flashcards, dependent: :destroy

  def next
    Flashcard.where(['id > ? and stack_id = ?', id, stack_id]).first
  end
end
