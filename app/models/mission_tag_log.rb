class MissionTagLog < ApplicationRecord
  belongs_to :mission
  belongs_to :tag
end
