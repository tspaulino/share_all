class GroupsController < ApplicationController  
  
  before_filter :find_owner, :only => [:index] 
   
  def index
    @groups = @owner ? @owner.groups.all : Group.all
  end
  
  def show
    @group = Group.find(params[:id])
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
    redirect_to user_groups_url(@group.user)
  end   
  
  def join
    @group = Group.find(params[:id])           
    user = User.find(params[:user_id])             
    if @group.members.include?(user)
      flash[:error] = "You're already participating! Can't subscribe again."
      redirect_to :back
    else
      @group.members << user
      @group.save           
      flash[:notice] = "Participating on group!"
      redirect_to [@group.user, @group] 
    end      
  end
end
