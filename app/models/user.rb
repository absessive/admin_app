class User < ActiveRecord::Base
  include ActiveModel::SecurePassword::InstanceMethodsOnActivation
  attr_accessible :email, :first, :last, :username, :password, :password_confirmation, :roles
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  validates :username, :presence => true, :length => { maximum: 16 }, :uniqueness => { case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { with: VALID_EMAIL_REGEX }, :uniqueness => { case_sensitive: false}
  validates :first, :presence => true
  validates :last, :presence => true
  validates_length_of :password, :on => :create, :in => 6..16
  validates_presence_of :password, :on => :create 
  validates_presence_of :password_confirmation, :on => :create 
  
  def is_admin?
    self.roles.gsub(" ","").split(',').include?('admin')    
  end
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  
end
