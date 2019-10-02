class Song < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  
  has_many :song_tags, dependent: :destroy
  has_many :tags, through: :song_tags

  has_one_attached :song_link

  validates :title, :description, :genre, :user_id, :song_link, presence: true
end
