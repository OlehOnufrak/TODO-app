class AddMyAudienceIdToMembership < ActiveRecord::Migration[6.1]
  def change
    add_reference :memberships, :my_audience, null: false, foreign_key: true
  end
end
