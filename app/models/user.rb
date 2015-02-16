class User < ActiveRecord::Base
  before_save { self.email = email.downcase } #ensures email is formatted 

  validates :name,  presence: true, length: { maximum: 50 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  #automagically creates PW & PW_confirmtaion attributes, 
  #validates presence, ensures they match, authenitcates by comparing PW & 
  #PW_digest
  has_secure_password 

end
