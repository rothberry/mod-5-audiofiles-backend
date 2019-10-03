class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :song

  validates :song_id, :user_id, presence: true
  
  # TODO Fix Favorites relationship
  # validates :user_id, uniqueness: { scope: :song_id,
  #   message: "favorite: (song <-> user) relationship already exists" }
  
end
