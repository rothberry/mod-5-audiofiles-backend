class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :song

  validates :song_id, :user_id, presence: true
end
