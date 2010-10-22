require 'spec_helper'

describe Event do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :location => "value for location",
      :start_time => Time.now,
      :end_time => Time.now,
      :latitude => 1,
      :longitude => 1,
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Event.create!(@valid_attributes)
  end       
  
  it "should not create a event without a name, location, start_time or end_time" do
  end
  
end
