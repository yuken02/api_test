class AddRowOrderToTodos < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :row_order, :integer
  end
end
