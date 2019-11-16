class AddUserToTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :tags, :user, foreign_key: true, index: true
  end
end
