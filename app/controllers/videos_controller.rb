class VideosController < ApplicationController
  def index
    @videos = @current_user.videos.all
  end
  
  def show
    @video = Video.find(params[:id])
  end
  
  def new
    @video = @current_user.videos.build
  end
  
  def create
    @video = @current_user.videos.build(params[:video])
    if @video.save       
      @video.convert
      flash[:notice] = "Successfully created video."
      redirect_to [@current_user, @video]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @video = @current_user.videos.find(params[:id])
  end
  
  def update
    @video = @current_user.videos.find(params[:id])
    if @video.update_attributes(params[:video])
      flash[:notice] = "Successfully updated video."
      redirect_to [@current_user, @video]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @video = @current_user.videos.find(params[:id])
    @video.destroy
    flash[:notice] = "Successfully destroyed video."
    redirect_to :back
  end
end
