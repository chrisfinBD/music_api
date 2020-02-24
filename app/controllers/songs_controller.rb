class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :destroy]

  # GET /songs
  def index
    response.headers["Access-Control-Allow-Origin"] = "*"
    @songs = Song.all

    render json: @songs
  end

  # GET /songs/1
  def show
    render json: @song
  end

  # POST /songs
  def create
    @song = Song.new(song_params)

    if @song.save
      render json: @song, status: :created, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /songs/1
  def update
    #binding.irb
    #puts request.raw_post
    if @song.update(song_params)
      render json: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      #puts params
      @song = Song.find(params[:id])
      #binding.irb
    end

    # Only allow a trusted parameter "white list" through.
    def song_params
      #puts params.inspect
      params.require(:song).permit(:title, :released_at, :artist_name, :rating, :song)
    end
end
