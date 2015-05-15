class TracksController < ApplicationController
  before_action :redirect_to_sign_in_page

  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    @album = Album.find(params[:album_id])
    @band = @album.band
    @albums = @band.albums
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)

    @album = Album.find(params[:track][:album_id])

    @band = @album.band

    @albums = @band.albums

    if @track.save
      flash.now[:notice] = ['Successfully added track!']
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :track_type, :title)
  end
end
