class CreateFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcards do |t|
      t.string :question
      t.string :notes
      t.string :type

      # attribute for OpenAnswer
      t.string :answer

      # attributes for MultipleChoice and SingleChoice
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4

      # attributes for MultipleChoice
      t.boolean :option1_correct
      t.boolean :option2_correct
      t.boolean :option3_correct
      t.boolean :option4_correct

      # attribute for SingleChoice
      t.integer :correct_option

      # attribute for TrueFalse
      t.boolean :correct

      t.references :stack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
