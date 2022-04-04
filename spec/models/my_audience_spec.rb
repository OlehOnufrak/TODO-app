# == Schema Information
#
# Table name: my_audiences
#
#  id         :integer          not null, primary key
#  user_email :string
#  todo_list  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe MyAudience, type: :model do
  let!(:my_audience) { create(:my_audience) }

  it 'have valid factory' do
    expect(my_audience).to be_valid
  end
end
