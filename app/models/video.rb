class Video < ActiveRecord::Base    
  include AASM
  aasm_column :state
  belongs_to :user            
  has_attached_file :video
  validates_presence_of :name
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable  
  validates_attachment_presence :video
  validates_attachment_content_type :video, :content_type => ["video/x-msvideo", "video/avi"], :message => "Wrong file format"
  validates_attachment_size :video, :less_than => 100.megabytes
  
  aasm_initial_state :pending
  aasm_state :pending
  aasm_state :converting
  aasm_state :converted, :enter => :set_new_filename
  aasm_state :error
  
  aasm_event :convert do
    transitions :from => :pending, :to => :converting
  end
  
  aasm_event :converted do
    transitions :from => :converting, :to => :converted
  end                                                   
  
  aasm_event :failed do
    transitions :from => :converting, :to => :error
  end                                               
  
  def convert
    self.convert!
    success = system(convert_command)
    if success #&& $?.exit_status == 0 
      self.delete_original_file
      self.converted!
    else
      self.failed!
    end
  end
  
  protected

  # This method creates the ffmpeg command that we'll be using
  def convert_command
    #new_name = "#{File.basename(video.path, ".*").parameterize}.avi"            
    File.rename(video.path, File.join(File.dirname(video.path), "#{video_file_name.parameterize}.avi"))
    #File.rename(video.path, File.join(File.dirname(video.path), n))
    original = File.join(File.dirname(video.path), "#{video_file_name.parameterize}.avi") 
    #update_attribute(:video_file_name, "#{video_file_name.parameterize}.avi")     
    flv = File.join(File.dirname(video.path), "#{video_file_name.parameterize}.flv")
    File.open(flv, 'w')                                   
    command = "ffmpeg -i #{original} -y -r 25 -b 150 -ar 22050 -ab 32 #{flv}"
    #ffmpeg -i #{video.path} -ar 22050 -ab 32 -acodec mp3 -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y #{flv}"
    command.gsub(/\s/, "")     
    puts "Final command: >>>>>> #{command}"   
    command
  end

  # This update the stored filename with the new flash video file
  def set_new_filename
    update_attribute(:video_file_name, "#{video_file_name.parameterize}.flv")
  end     
  
  def delete_original_file
    FileUtils.rm(File.join(File.dirname(video.path), "#{video_file_name.parameterize}.avi"))  
  end
  
end
