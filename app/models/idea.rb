class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :joins, dependent: :destroy
  has_many :joining_users, through: :joins, source: :users
end
