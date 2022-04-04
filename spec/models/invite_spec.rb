# == Schema Information
#
# Table name: invites
#
#  id             :integer          not null, primary key
#  token          :string
#  email          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  my_audience_id :integer          not null
#
require 'rails_helper'

RSpec.describe Invite, type: :model do
  let!(:my_audience) { create(:my_audience) }
  let!(:invite) { create(:invite) }

  it 'have valid factory' do
    expect(invite).to be_valid
  end
end
