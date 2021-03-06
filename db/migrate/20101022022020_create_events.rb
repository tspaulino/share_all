class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.float :latitude
      t.float :longitude
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
