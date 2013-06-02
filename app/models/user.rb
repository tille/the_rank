class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  
  has_secure_password
  
  validates :password, presence: { on: :create }
  validates :email, presence: true, uniqueness: :email  
end