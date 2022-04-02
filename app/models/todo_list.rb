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
end
