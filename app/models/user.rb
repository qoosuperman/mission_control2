class User < ApplicationRecord
  has_many :missions
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token 

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

   # This line for peventing mass assignment
  # attr_accessor :name, :email
  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
