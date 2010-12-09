class User < ActiveRecord::Base

  acts_as_authentic
  
  login_field :login
       
  has_attached_file :avatar, :styles => {:thumb => "100x150#", :small => "45x45#"} 
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/jpg", "image/png", "image/gif"]
  has_many :comments_received, :class_name => "Comment", :as => :commentable    
  has_many :comments
  has_many :groups
  has_many :events
  has_many :images
  has_many :documents
  has_many :videos
  has_many :musics     
  has_many :albums
  has_and_belongs_to_many :participated_events, :class_name => "Event", :join_table => "users_events" 
  has_and_belongs_to_many :participated_groups, :class_name => "Group", :join_table => "users_group" 
  
end
