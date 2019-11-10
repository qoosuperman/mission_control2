class User < ApplicationRecord
  has_many :missions
  before save { |user| user.email = email.downcase }

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  # This line for peventing mass assignment
  # attr_accessor :name, :email
end
