class AddPositionToTodos < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :position, :integer, null: false, default: 0
    add_index :todos, :position
  end
end
