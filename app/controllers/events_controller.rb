class EventsController < ApplicationController   
  before_filter :find_owner, :only => [:index]
  
  def index
    @events = @owner ? @owner.events.all : Event.all
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = @current_user.events.new
  end
  
  def create
    @event = @current_user.events.new(params[:event])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to [@current_user, @event]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = @current_user.events.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to [@current_user, @event]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to users_events_url(@current_user)
  end
  
  def join
    @event = Event.find(params[:id])           
    user = User.find(params[:user_id])             
    if @event.members.include?(user)
      flash[:error] = "You're already participating! Can't subscribe again."
      redirect_to [@current_user, @event]
    else
      @event.members << user
      @event.save           
      flash[:notice] = "Participating on event!"
      redirect_to [@event.user, @event] 
    end      
  end
end
