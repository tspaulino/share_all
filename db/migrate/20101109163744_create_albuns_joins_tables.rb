class CreateAlbunsJoinsTables < ActiveRecord::Migration
  def self.up
    create_table :albuns_musics, :id => false do |t|
      t.integer :album_id      
      t.integer :music_id
      
      t.timestamps 
    end       
       
    create_table :albuns_documents, :id => false do |t|
      t.integer :album_id      
      t.integer :document_id

      t.timestamps 
    end    
    create_table :albuns_images, :id => false do |t|
      t.integer :album_id      
      t.integer :image_id

      t.timestamps 
    end            
    
    create_table :albuns_videos, :id => false do |t|
      t.integer :album_id      
      t.integer :video_id

      t.timestamps 
    end
  end

  def self.down   
    drop_table :albuns_musics
    drop_table :albuns_documents
    drop_table :albuns_images
    drop_table :albuns_videos
  end
end
