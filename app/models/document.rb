class Document < ActiveRecord::Base
  belongs_to :user    
  has_attached_file :file
  validates_presence_of :name, :message => "Mandatory field!"      
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable      
  validates_attachment_presence :file
  validates_attachment_content_type :file, :content_type => ["application/pdf", "application/msword"]
  validates_attachment_size :file, :less_than => 10.megabytes
  
  
end
