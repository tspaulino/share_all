class Album < ActiveRecord::Base
  belongs_to :user                                                  

  has_and_belongs_to_many :documents, :join_table => "albuns_documents"
  has_and_belongs_to_many :videos, :join_table => "albuns_videos"
  has_and_belongs_to_many :images, :join_table => "albuns_images"
  has_and_belongs_to_many :musics, :join_table => "albuns_musics"     
  
  validates_uniqueness_of :name, :on => :create, :message => "must be unique", :scope => :user_id
  
end
