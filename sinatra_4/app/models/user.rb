require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  has_many :votes
  
  validates :email, presence: true, uniqueness: true

  before_validation { self.email.downcase! }
end