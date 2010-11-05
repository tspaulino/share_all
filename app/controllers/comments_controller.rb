class CommentsController < ApplicationController                
  #before_filter :find_current_user
    
  def index
    @comments = @current_user.comments.all
  end
  
  def show
    @comment = @current_user.comments.find(params[:id])
  end
  
  def new
    @comment = @current_user.comments.build
    @comment.commentable_id = params[:object_id]
    @comment.commentable_type = params[:klazz]
  end
  
  def create
    @comment = @current_user.comments.build(params[:comment])
    @comment.user = @current_user
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to [@current_user, @comment]
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
    @comment = @current_user.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to :back
  end       
    
end
