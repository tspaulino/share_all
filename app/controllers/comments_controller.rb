class CommentsController < ApplicationController                
    
  def index
    @comments = @current_user.comments_received.all
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to :back
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comment = @current_user.comments.find(params[:id])
  end
  
  def update
    @comment = @current_user.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to [@current_user, @current_user, @comment]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to :back
  end       
    
end
