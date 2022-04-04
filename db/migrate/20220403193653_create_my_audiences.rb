class CreateMyAudiences < ActiveRecord::Migration[6.1]
  def change
    create_table :my_audiences do |t|
      t.string :user_email
      t.string :todo_list

      t.timestamps
    end
  end
end
