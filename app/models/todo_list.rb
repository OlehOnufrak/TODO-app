# == Schema Information
#
# Table name: todo_lists
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TodoList < ApplicationRecord
  has_many :todo_items

  def percent_done
    done_todo_items = todo_items.pluck(:done_at).compact.size
    total_todo_items = todo_items.size
    return 0 if total_todo_items == 0

    (100 * done_todo_items.to_f / total_todo_items).round(1)
  end
end
