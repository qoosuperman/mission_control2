class User < ApplicationRecord
  has_many :missions

  validates :name, presence: true
  # This line for peventing mass assignment
  attr accessible :name, :email
end
