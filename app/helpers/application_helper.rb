# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def rating(object)
    liked = object.votes.find(:all, :conditions => {:like => 1}).count
    disliked = object.votes.find(:all, :conditions => {:dislike => 1}).count
    total = liked + disliked
    html = content_tag(:strong, "#{total} votes")
    html << content_tag(:p, "#{liked} people like this")
    html << content_tag(:p, "#{disliked} people didn't like this")
    html
  end  

end
