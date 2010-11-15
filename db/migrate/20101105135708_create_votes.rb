class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|  
      t.references :user
      t.integer :like, :default => 0
      t.integer :dislike, :default => 0
      t.string :votable_type
      t.integer :votable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
