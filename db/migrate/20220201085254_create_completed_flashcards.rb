class CreateCompletedFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :completed_flashcards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :flashcard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
