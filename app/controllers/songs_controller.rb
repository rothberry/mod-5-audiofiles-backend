class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    songs = Song.all
    song_array = []
    songs.map do | song |
      p song.song_link
      if (song.song_link.attached?)
        song_link = url_for(song.song_link)
        song_array.push({ song: song, song_link: song_link })
      else
        song_array.push({ song: song })
      end
    end
    render json: song_array
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    song = Song.new(song_params)
    p '*************************SONG CREATE***************'
    if song.save
      render json: { song: song, song_link: url_for(song.song_link) }, status: :created
    else
      render json: {error: song.errors.full_messages}, status: :not_acceptable
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    p '************SONG UPDATE*******'
    song.song_link.attach(params[:song_link])
    if song.update(song_params)
      render json: song, status: :ok
    else
      render json: {error: song.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    song.destroy
    render json: {message: "Song deleted"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :user_id, :genre, :description, :number_of_plays, :song_link)
    end
end
