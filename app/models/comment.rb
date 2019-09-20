class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :song

  validates :user_id, :song_id, :content, presence: true
end
