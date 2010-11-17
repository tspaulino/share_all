class AlbumsController < ApplicationController          
  before_filter :find_owner, :only => [:index]
  
  def index
    @albums = @owner ? @owner.albums.all : Album.all
  end
  
  def show
    @album = Album.find(params[:id])
  end
  
  def new
    @album = @current_user.albums.build
  end
  
  def create
    @album = @current_user.albums.build(params[:album])
    if @album.save
      flash[:notice] = "Successfully created album."
      redirect_to [@current_user, @album]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @album = Album.find(params[:id])
  end
  
  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      flash[:notice] = "Successfully updated album."
      redirect_to @album
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:notice] = "Successfully destroyed album."
    redirect_to user_albums_url(@current_user)
  end
end
