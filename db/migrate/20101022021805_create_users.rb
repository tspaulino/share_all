class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :login
      t.string :email
      t.text :description
      t.string :hometown
      t.string :persistence_token
      t.string :crypted_password
      t.boolean :active, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
