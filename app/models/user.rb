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

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
