class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash.now[:notice] = ['Successfully added album!']
      redirect_to albums_url
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.new(album_params)
    if @album.save
      flash.now[:notice] = ['Successfully updated album info!']
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash.now[:notice] = ['Successfully removed album!']
    redirect_to albums_url
  end

  private

  def album_params
    params.require(:album).permit(:name)
  end
end
