class DocumentsController < ApplicationController         
  before_filter :find_owner
  
  def index
    @documents = @owner.documents
  end
  
  def show
    @document = Document.find(params[:id])
  end
  
  def new
    @document = @current_user.documents.build
  end
  
  def create
    @document = @current_user.documents.build(params[:document])
    if @document.save
      flash[:notice] = "Successfully created document."
      redirect_to [@current_user, @document]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @document = Document.find(params[:id])
  end
  
  def update
    @document = @current_user.documents.find(params[:id])
    if @document.update_attributes(params[:document])
      flash[:notice] = "Successfully updated document."
      redirect_to [@current_user, @document]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:notice] = "Successfully destroyed document."
    redirect_to user_documents_url(@current_user)
  end
    
end
