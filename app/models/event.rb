class Event < ActiveRecord::Base
  belongs_to :user          
  #has_permalink :name, :update => true
  validates_presence_of [:name, :location]
  has_many :comments, :as => :commentable 
  has_and_belongs_to_many :members, :class_name => "User", :join_table => "users_events"   
end
