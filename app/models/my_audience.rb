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
class MyAudience < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :invites, dependent: :destroy
end
