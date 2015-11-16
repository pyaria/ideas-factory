class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :hello
  validates :email, presence: true, uniqueness: true

end
