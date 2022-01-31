class CreateStacks < ActiveRecord::Migration[7.0]
  def change
    create_table :stacks do |t|
      t.string :title
      t.integer :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
