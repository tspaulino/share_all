class MusicsController < ApplicationController
  def index
    @musics = Music.all
  end
  
  def show
    @music = Music.find(params[:id])
  end
  
  def new
    @music = Music.new
  end
  
  def create
    @music = Music.new(params[:music])
    if @music.save
      flash[:notice] = "Successfully created music."
      redirect_to @music
    else
      render :action => 'new'
    end
  end
  
  def edit
    @music = Music.find(params[:id])
  end
  
  def update
    @music = Music.find(params[:id])
    if @music.update_attributes(params[:music])
      flash[:notice] = "Successfully updated music."
      redirect_to @music
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @music = Music.find(params[:id])
    @music.destroy
    flash[:notice] = "Successfully destroyed music."
    redirect_to musics_url
  end
end
