class Document < ActiveRecord::Base
  belongs_to :user    
  has_attached_file :file
  validates_presence_of :name, :message => "Mandatory field!"      
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable
end
