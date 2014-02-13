require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  validates :name, presence: true 
  validates :email, presence: true 

  def password 
    @password ||= Password.new(password_hash)
  end

  def password=(new_pass)
    @password = Password.create(new_pass)
    self.password_hash = @password
  end
end
