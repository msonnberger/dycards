class CompletedFlashcard < ApplicationRecord
  belongs_to :user
  belongs_to :flashcard
end
