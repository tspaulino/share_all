class Music < ActiveRecord::Base
  belongs_to :user
  has_attached_file :music
  validates_presence_of :name
  has_many :comments, :as => :commentable
  has_one :vote, :as => :votable
end
