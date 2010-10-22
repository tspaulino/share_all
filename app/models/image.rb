class Image < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  validates_presence_of :name
  has_many :comments, :as => :commentable
end
