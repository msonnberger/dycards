class User < ApplicationRecord
  has_secure_password
  has_many :stacks, dependent: :destroy
  validates :password, confirmation: true
  validates :username, uniqueness: true
end
