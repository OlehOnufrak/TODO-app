# == Schema Information
#
# Table name: todo_lists
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy
  belongs_to :user

  def percent_done
    done_todo_items = todo_items.pluck(:done_at).compact.size
    total_todo_items = todo_items.size
    return 0 if total_todo_items == 0

    (100 * done_todo_items.to_f / total_todo_items).round(1)
  end
end
