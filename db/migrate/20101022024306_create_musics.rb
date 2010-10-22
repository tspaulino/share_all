class CreateMusics < ActiveRecord::Migration
  def self.up
    create_table :musics do |t|
      t.string :name
      t.string :author
      t.references :user
      t.string :music_file_name
      t.string :music_content_type
      t.integer :music_file_size
      t.datetime :music_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :musics
  end
end
