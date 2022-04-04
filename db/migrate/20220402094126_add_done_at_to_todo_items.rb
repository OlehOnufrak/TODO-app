class AddDoneAtToTodoItems < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_items, :done_at, :datetime
  end
end
