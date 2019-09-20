class User < ApplicationRecord
  has_secure_password
  has_many :songs
  has_many :comments
  has_many :favorites
  
  has_many :active_relationships, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Following', foreign_key: 'followed_id', dependent: :destroy
  has_many :followed_users, through: :active_relationships, source: :followed
  has_many :follower_users, through: :passive_relationships, source: :follower

  validates :username, :password, :name, :location, :bio, presence: true
  validates :username, uniqueness: true
  validates :username, length: {minimum: 1, maximum: 20}
end
