require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :login => "value for login",
      :email => "value for email",
      :description => "value for description",
      :hometown => "value for hometown",
      :persistence_token => "value for persistence_token",
      :crypted_password => "value for crypted_password",
      :active => false
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end    
  
  it "should not create a new user without password, login or email" do
  end
  
  it "should update the user given valid attributes" do
  end
  
  it "should deactivate an user" do
  end
  
end
