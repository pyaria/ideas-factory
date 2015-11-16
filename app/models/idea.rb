class Idea < ActiveRecord::Base
  has_attached_file(:image)
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :joins, dependent: :destroy
  has_many :joining_users, through: :joins, source: :users

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :users

end
