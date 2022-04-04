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
class Invite < ApplicationRecord
  before_create :generate_invite_token

  belongs_to :my_audience

  def generate_invite_token
    self.token = SecureRandom.urlsafe_base64(8, false)
  end
end
