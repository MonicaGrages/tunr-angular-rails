class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render json: @artists
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    render json: {
      artist: @artist,
      songs: @songs
    }
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      render json: {
        artist: @artist
      }
    else
      render status: 500,
             json: {
               error: @artist.errors
             }
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      render json: {
        artist: @artist
      }
    else
      render status: 500,
             json: {
               error: @artist.errors
             }
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    if @artist.destroy
      render json: {
        message: 'Successfully deleted artist'
      }
    else
      render status: 500,
             json: {
               error: 'Could not delete Artist'
             }
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :photo_url, :nationality)
  end
end

# class ArtistsController < ApplicationController
#   def index
#     @artists = Artist.all
#     render json: @artists
#     #Overwrites the assumption to render an index.html.erb
#   end

#   def create
#     @artist = Artist.new(artist_params)
#     if @artist.save
#       #we don't want the bang after save because if we have it, we won't get the JSON error below, which we need to give to angular so we can render an error to the user
#       redirect_to artist_path(@artist)
#     else
#       render status: 500,
#         json: {
#         error: @artist.errors
#       }
#     end
#   end

#   def show
#     @artist = Artist.find(params[:id])
#     @songs = @artist.songs
#     render json: {
#       "artist": @artist,
#       "songs": @songs
#     }
#   end

#   def update
#     @artist = Artist.find(params[:id])
#     # @artist.update(artist_params)
#     if @artist.update(artist_params)
#       #we don't want the bang after save because if we have it, we won't get the JSON error below, which we need to give to angular so we can render an error to the user
#       redirect_to artist_path(@artist)
#     else
#       render status: 500,
#         json: {
#         error: @artist.errors
#       }
#     end
#   end

#   def destroy
#     @artist = Artist.find(params[:id])
#     if @artist.destroy
#       redirect_to artists_path
#     else
#       render status: 500,
#         json: {
#           error: "Could not delete Artist"
#         }
#     end
#   end

#   private

#   def artist_params
#     params.require(:artist).permit(:name, :photo_url, :nationality)
#   end
# end
