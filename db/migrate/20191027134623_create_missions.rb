class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.text :content
      t.string :status
      t.integer :priority
      t.integer :category
      
      t.timestamps
    end
  end
end
