class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :hello
  validates :email, presence: true, uniqueness: true

  has_many :comments, dependent: :nullify

  has_many :ideas, dependent: :nullify

  has_many :joins, dependent: :destroy
  has_many :joined_ideas, through: :joins, source: :idea

  has_many :likes, dependent: :nullify
  has_many :liked_ideas, through: :likes, source: :idea
end
