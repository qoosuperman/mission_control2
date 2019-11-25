class RemoveMissionFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tags, :mission, index: true, foreign_key: true
  end
end
