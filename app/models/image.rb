require 'paperclip'
class Image < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => {:thumb => "150x150>", :medium => "640x480>", :small => "45x45>"}
  validates_presence_of :name
  has_many :comments, :as => :commentable                
  has_many :votes, :as => :votable             
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ["image/jpeg", "image/png", "image/jpg", "image/gif"]
  validates_attachment_size :image, :less_than => 5.megabytes
end
