class Image < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => {:thumb => "150x150>", :medium => "640x480>"}
  validates_presence_of :name
  has_many :comments, :as => :commentable                
  has_many :votes, :as => :votable
end
