class GroupsController < ApplicationController
  def index
    @groups = @current_user.groups.all
  end
  
  def show
    @group = @current_user.groups.find(params[:id])
  end
  
  def new
    @group = @current_user.groups.new
  end
  
  def create
    @group = @current_user.groups.new(params[:group])
    if @group.save
      flash[:notice] = "Successfully created group."
      redirect_to [@current_user, @group]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @group = @current_user.groups.find(params[:id])
  end
  
  def update
    @group = @current_user.groups.find(params[:id])
    if @group.update_attributes(params[:group])
      flash[:notice] = "Successfully updated group."
      redirect_to [@current_user, @group]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @group = @current_user.groups.find(params[:id])
    @group.destroy
    flash[:notice] = "Successfully destroyed group."
    redirect_to :back
  end
end
