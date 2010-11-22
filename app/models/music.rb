class Music < ActiveRecord::Base
  belongs_to :user
  has_attached_file :music
  validates_presence_of :name
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable           
  validates_attachment_presence :music
  validates_attachment_content_type :music, :content_type => ["audio/mpeg", "audio/x-mp3", "audio/mpg", "audio/mp3"]
  validates_attachment_size :music, :less_than => 10.megabytes
  
  def rename_file                         
    new_name = "#{File.basename(music.path, ".*").parameterize}.mp3"
    File.rename(music.path, File.join(File.dirname(music.path), new_name))
    update_attribute(:music_file_name, new_name)
  end
end
