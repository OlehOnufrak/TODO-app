# == Schema Information
#
# Table name: todo_items
#
#  id           :integer          not null, primary key
#  title        :string
#  todo_list_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  done_at      :datetime
#
require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  let!(:todo_list) { create(:todo_list) }
  let!(:todo_item) { create(:todo_item) }

  it 'have valid factory' do
    expect(todo_item).to be_valid
  end
end
