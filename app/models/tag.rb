class Tag < ApplicationRecord
  has_many :songs, through: :song_tags

  validates :name, uniqueness: true
  validates :name, presence: true
end
