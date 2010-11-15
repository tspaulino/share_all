class VotesController < ApplicationController       
   
   def like
      @vote = Vote.find(:first, :conditions => {:user_id => params[:vote][:user_id], :votable_id => params[:vote][:votable_id], :votable_type => params[:vote][:votable_type]})
      if @vote
        flash[:error] = "You already voted on this content!"
      else
        @vote = Vote.new(params[:vote])
        @vote.like = 1
        @vote.save
        flash[:notice] = "Vote for 'like' increased!"                       
      end                                   
      redirect_to :back
    end
    
    def dislike
      @vote = Vote.find(:first, :conditions => {:user_id => params[:vote][:user_id], :votable_id => params[:vote][:votable_id], :votable_type => params[:vote][:votable_type]})
      if @vote
        flash[:error] = "You already voted on this content!"
      else
        @vote = Vote.new(params[:vote])
        @vote.dislike = 1
        @vote.save
        flash[:notice] = "Vote for 'dislike' increased!"                       
      end                         
      redirect_to :back    
    end
end
