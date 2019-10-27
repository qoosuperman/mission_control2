class AddUserRefToMissions < ActiveRecord::Migration[5.2]
  def change
    add_reference :missions, :user, null: false, foreign_key: true
  end
end
