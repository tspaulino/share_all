class Album < ActiveRecord::Base
  belongs_to :user                                                  

  has_and_belongs_to_many :documents, :join_table => "albuns_documents"
  has_and_belongs_to_many :videos, :join_table => "albuns_videos"
  has_and_belongs_to_many :images, :join_table => "albuns_images"
  has_and_belongs_to_many :musics, :join_table => "albuns_musics"     
  
  validates_uniqueness_of :name, :on => :create, :message => "must be unique", :scope => :user_id

  def video_attributes=(video_attributes)
    video_attributes.each do |attributes|      
      videos << Video.find(attributes['id'])      
    end
  end                   
  
  def music_attributes=(music_attributes)
    music_attributes.each do |attributes|      
      musics << Music.find(attributes['id'])      
    end
  end
  
  def image_attributes=(image_attributes)
    image_attributes.each do |attributes|      
      images << Image.find(attributes['id'])      
    end
  end
  
  def document_attributes=(document_attributes)
    document_attributes.each do |attributes|      
      documents << Document.find(attributes['id'])      
    end
  end
  
end
