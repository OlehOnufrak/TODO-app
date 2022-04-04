# == Schema Information
#
# Table name: memberships
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  my_audience_id :integer          not null
#  user_id        :integer          not null
#
require 'rails_helper'

RSpec.describe Membership, type: :model do
  let!(:membership) { create(:membership) }

  it 'have valid factory' do
    expect(membership).to be_valid
  end
end
