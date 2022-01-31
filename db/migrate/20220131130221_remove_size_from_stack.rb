class RemoveSizeFromStack < ActiveRecord::Migration[7.0]
  def change
    remove_column :stacks, :size, :integer
  end
end
