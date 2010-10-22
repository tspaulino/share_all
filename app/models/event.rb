class Event < ActiveRecord::Base
  belongs_to :user          
  #has_permalink :name, :update => true
  validates_presence_of [:name, :location]
  has_many :comments, :as => :commentable    
end
