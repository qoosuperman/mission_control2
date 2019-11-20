class Tag < ApplicationRecord
  has_many :mission_tag_logs
  has_many :missions, through: :mission_tag_logs
  belongs_to :user
end
