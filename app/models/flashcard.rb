class Flashcard < ApplicationRecord
  belongs_to :stack
  validates :question, presence: true

  def next
    Flashcard.where(['id > ? and stack_id = ?', id, stack_id]).first
  end
end
