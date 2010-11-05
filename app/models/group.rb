class Group < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable       
  validates_presence_of :name      
  has_and_belongs_to_many :members, :class_name => "User", :join_table => "users_groups"
end
