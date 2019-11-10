class User < ApplicationRecord
  has_many :missions

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :email, presence: true
  # This line for peventing mass assignment
  attr_accessor :name, :email
end
