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
require 'rails_helper'

RSpec.describe TodoList, type: :model do
  let!(:user) { create(:user) }
  let!(:todo_list) { create(:todo_list) }

  it 'have valid factory' do
    expect(todo_list).to be_valid
  end
end
