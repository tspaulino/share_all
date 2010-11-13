class AddingPermalinksForData < ActiveRecord::Migration
  def self.up
    add_column :users, :permalink, :string
    add_column :groups, :permalink, :string   
  end

  def self.down  
    remove_column :users, :permalink
    remove_column :groups, :permalink
  end
end
