class SongTagsController < ApplicationController
  before_action :set_song_tag, only: [:destroy]

  def index
    song_tags = SongTag.all
    render json: song_tags
  end

  def create
    song_tag = SongTag.new(song_tag_params)
    p '*******************SONG_TAG CREATE************'
    if song_tag.save
      render json: song_tag, status: :created
    else
      render json: {error: song_tag.errors.full_messages}, status: :not_acceptable
    end
  end
  
  def destroy
    song_tag.destroy
    render json: {message: "Song_tag Deleted"}
  end
  
  private

  def set_song_tag
    song_tag = SongTag.find(params[:id])
  end

  def song_tag_params
    params.require(:song_tag)
  end
  
end
