class User < ApplicationRecord
  has_many :missions, :dependent => :delete_all
  has_secure_password

  enum role: { admin: 'admin', user: 'user' }

  attr_accessor :skip_password_validation

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token 
  before_destroy :check_last_admin

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, unless: :skip_password_validation
  validates :password_confirmation, presence: true, unless: :skip_password_validation

   # This line for peventing mass assignment
  # attr_accessor :name, :email
  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def check_last_admin
    if User.where(role: "admin").count == 1
      errors[:base] << I18n.t("user.admin_only_one")
      throw :abort
    end
  end
end
