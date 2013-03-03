class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :username, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  
  validates :username, :presence => true, :length => { maximum: 16 }, :uniqueness => { case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { with: VALID_EMAIL_REGEX }, :uniqueness => { case_sensitive: false}
  validates :first, :presence => true
  validates :last, :presence => true
  validates :password, :presence => true, :length => { minimum: 6 } 
  validates :password_confirmation, :presence => true 
end
