class User < ActiveRecord::Base
  #setting up one to many association
  has_many :articles, dependent: :destroy
  #before user hits database, turns email to lowercase before storing
  before_save {self.email = email.downcase}
  
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false },
            length: {minimum: 3, maximum: 30}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
end