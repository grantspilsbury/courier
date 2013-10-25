class User < ActiveRecord::Base
  attr_accessible :contact_number, :name, 
  :email, :company, :password, :password_confirmation, 

  before_save { self.email = email.downcase }

  has_secure_password

  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
