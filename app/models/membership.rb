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
class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :my_audience
end
