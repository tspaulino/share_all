require 'spec_helper'

describe Comment do
  before(:each) do
    @valid_attributes = {
      :text => "value for text",
      :user_id => 1,
      :approved => false,
      :commentable_type => "value for commentable_type",
      :commentable_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Comment.create!(@valid_attributes)
  end        
  
  it "should list just approved comments on named_space" do
  end
  
  it "should not create a comment without a text" do
  end
   
end
