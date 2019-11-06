class AddIndexToMissions < ActiveRecord::Migration[5.2]
  def change
    change_table :missions do |t|
      t.index :title
      t.index :status
    end
  end
end
