# == Schema Information
#
# Table name: todo_items
#
#  id           :integer          not null, primary key
#  title        :string
#  todo_list_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class TodoItem < ApplicationRecord
  belongs_to :todo_list
end
