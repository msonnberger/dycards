class User < ApplicationRecord
  has_secure_password
  has_many :stacks, dependent: :destroy
  has_many :completed_flashcards
  validates :password, confirmation: true
  validates :username, uniqueness: true
end
