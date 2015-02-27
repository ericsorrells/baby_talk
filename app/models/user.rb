class User < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :babies,  dependent: :destroy

  #ensures email is formatted
  before_save { self.email = email.downcase }
  #before saving User to db, create remember token
  before_create :create_remember_token 

  #validations
  validates :name,  presence: true, length: { maximum: 50 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 254 },
    format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :phone, presence: true, length: { is: 10 }

  #automagically creates PW & PW_confirmtaion attributes, 
  #validates presence, ensures they match, authenitcates by comparing PW & 
  #PW_digest
  has_secure_password 

  def self.find_user_by_phone_num(number)
    number.to_i
    User.where('phone = ?', number)
  end

  def User.new_remember_token
    #creates a new remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    #accepts token from new_remember_token and digests it
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      #sets own remember_token (attribute in db) equal to digested 
      ##remember token from above
      ##will be written to db when User is saved
      self.remember_token = User.digest(User.new_remember_token)
    end

end
