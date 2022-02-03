class User < ApplicationRecord
  has_secure_password
  has_many :stacks, dependent: :destroy
  has_many :completed_flashcards, dependent: :destroy
  has_many :flashcards, through: :completed_flashcards, dependent: :destroy
  validates :password, confirmation: true
  validates :username, uniqueness: true
end
