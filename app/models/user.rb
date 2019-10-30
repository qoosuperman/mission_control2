class User < ApplicationRecord
  has_many :missions

  validates :name, presence: true
end
