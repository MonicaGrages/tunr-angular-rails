class SongsController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs
    render json: @songs
    #Overwrites the assumption to render an index.html.erb
  end

  def create
    @song = Song.new(song_params)
    @artist = Artist.find(params[:artist_id])
    if @song.save
      #we don't want the bang after save because if we have it, we won't get the JSON error below, which we need to give to angular so we can render an error to the user
      redirect_to artist_song_path(@artist, @song)
    else
      render status: 500,
        json: {
        error: @song.errors
      }
    end
  end

  def show
    @song = Song.find(params[:id])
    render json: {
      "song": @song
    }
  end

  def update
    @song = Song.find(params[:id])
    @artist = Artist.find(params[:artist_id])
    if @song.update(song_params)
      #we don't want the bang after save because if we have it, we won't get the JSON error below, which we need to give to angular so we can render an error to the user
      redirect_to artist_song_path(@artist, @song)
    else
      render status: 500,
        json: {
        error: @song.errors
      }
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @artist = @song.artist
    if @song.destroy
      redirect_to artist_songs_path(@artist)
    else
      render status: 500,
        json: {
          error: "Could not delete song"
        }
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :preview_url, :album)
    .merge(:artist_id => Artist.find(params[:artist_id]).id)
  end
end
