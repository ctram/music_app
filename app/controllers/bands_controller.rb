class BandsController < ApplicationController
  before_action :redirect_to_sign_in_page

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash.now[:notice] = ['Successfully added band!']
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      flash.now[:notice] = ['Successfully updated Band info!']
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    flash.now[:notice] = ['Successfully removed Band!']
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
