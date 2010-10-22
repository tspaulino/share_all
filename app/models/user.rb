class User < ActiveRecord::Base
  acts_as_authentic             
  has_attached_file :avatar
  has_many :comments, :as => :commentable
  has_many :groups
  has_many :events
  has_many :images
  has_many :documents
  has_many :videos
  has_many :music
  
end
