class AddMyAudienceIdToInvite < ActiveRecord::Migration[6.1]
  def change
    add_reference :invites, :my_audience, null: false, foreign_key: true
  end
end
