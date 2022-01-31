class Flashcard < ApplicationRecord
  belongs_to :stack
  validates :question, presence: true
end
