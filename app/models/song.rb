class Song < ApplicationRecord
  has_many :comments
  has_many :favorites
  belongs_to :user
  
  has_many :song_tags
  has_many :tags, through: :song_tags

  has_one_attached :song_link

  validates :title, :description, :genre, :user_id, :song_link, presence: true
end
