class OfferMusicsController < ApplicationController
  def index
    @offer_musics = OfferMusic.where(is_end: 0)
  end

  def show
    @offer_music = OfferMusic.find(params[:id])
    @offer_music.update_attributes(is_end: 1)
    redirect_to offer_musics_path
  end

  def new
    @offer_music = OfferMusic.new
  end

  def create
    @offer_music = OfferMusic.new(music_params)
    if @offer_music.save
      redirect_to offer_musics_path
    else
      render :action => 'new'
    end
  end

  def edit
    @offer_music = OfferMusic.find(params[:id])
  end

  def update
    @offer_music = OfferMusic.find(params[:id])
    if @offer_music.update_attributes(params[:offer_music])
      redirect_to @offer_music, :notice  => "Successfully updated offer music."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @offer_music = OfferMusic.find(params[:id])
    @offer_music.destroy
    redirect_to offer_musics_url, :notice => "Successfully destroyed offer music."
  end

  private
  def music_params
    params.require(:offer_music).permit(:title, :singer, :offer_name, :memo)
  end
end
