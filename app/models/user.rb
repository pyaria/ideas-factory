class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :hello
  validates :email, presence: true, uniqueness: true

  has_many :comments, dependent: :nullify

  has_many :ideas, dependent: :nullify
end
