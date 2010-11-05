class MusicsController < ApplicationController
  def index
    @musics = @current_user.musics.all
  end
  
  def show
    @music = @current_user.musics.find(params[:id])
  end
  
  def new
    @music = @current_user.musics.build
  end
  
  def create
    @music = @current_user.musics.build(params[:music])
    if @music.save
      flash[:notice] = "Successfully created music."
      redirect_to [@current_user, @music]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @music = @current_user.musics.find(params[:id])
  end
  
  def update
    @music = @current_user.musics.find(params[:id])
    if @music.update_attributes(params[:music])
      flash[:notice] = "Successfully updated music."
      redirect_to [@current_user, @music]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @music = @current_user.musics.find(params[:id])
    @music.destroy
    flash[:notice] = "Successfully destroyed music."
    redirect_to :back
  end
end
