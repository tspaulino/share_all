class DocumentsController < ApplicationController         
  before_filter :find_user
  
  def index
    @documents = @user.documents
  end
  
  def show
    @document = @user.documents.find(params[:id])
  end
  
  def new
    @document = @user.documents.build
  end
  
  def create
    @document = @user.documents.build(params[:document])
    if @document.save
      flash[:notice] = "Successfully created document."
      redirect_to [@current_user, @document]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @document = @user.documents.find(params[:id])
  end
  
  def update
    @document = @user.documents.find(params[:id])
    if @document.update_attributes(params[:document])
      flash[:notice] = "Successfully updated document."
      redirect_to [@current_user, @document]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @document = @user.documents.find(params[:id])
    @document.destroy
    flash[:notice] = "Successfully destroyed document."
    redirect_to :back
  end
  
  def find_user
    params[:user_id] ? @user = User.find(params[:user_id]) : @user = @current_user
  end
end
