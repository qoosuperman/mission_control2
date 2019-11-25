class CreateMissionTagLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :mission_tag_logs do |t|
      t.references :mission, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
