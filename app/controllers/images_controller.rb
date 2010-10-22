class ImagesController < ApplicationController
  def index
    @images = @current_user.images.all
  end
  
  def show
    @image = @current_user.images.find(params[:id])
  end
  
  def new
    @image = @current_user.images.build
  end
  
  def create
    @image = @current_user.images.build(params[:image])
    if @image.save
      flash[:notice] = "Successfully created image."
      redirect_to [@image.user, @image]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @image = @current_user.images.find(params[:id])
  end
  
  def update
    @image = @current_user.images.find(params[:id])
    if @image.update_attributes(params[:image])
      flash[:notice] = "Successfully updated image."
      redirect_to [@image.user, @image]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @image = @current_user.images.find(params[:id])
    @image.destroy
    flash[:notice] = "Successfully destroyed image."
    redirect_to :back
  end
end
