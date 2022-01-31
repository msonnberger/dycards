class Stack < ApplicationRecord
  belongs_to :user
  has_many :flashcards, dependent: :destroy
  validates :title, presence: true
end
