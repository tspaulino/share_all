class User < ActiveRecord::Base
  acts_as_authentic             
  has_attached_file :avatar, :styles => {:thumb => "150x150>"}
  has_many :comments_received, :class_name => "Comment", :as => :commentable    
  has_many :comments
  has_many :groups
  has_many :events
  has_many :images
  has_many :documents
  has_many :videos
  has_many :musics     
  
  has_and_belongs_to_many :participated_events, :class_name => "Event", :join_table => "users_events" 
  has_and_belongs_to_many :participated_groups, :class_name => "Group", :join_table => "users_group" 
  
end
