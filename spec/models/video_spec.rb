require 'spec_helper'

describe Video do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :author => "value for author",
      :user_id => 1,
      :video_file_name => "value for video_file_name",
      :video_content_type => "value for video_content_type",
      :video_file_size => 1,
      :video_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Video.create!(@valid_attributes)
  end        
  
  it "should contain a valid video format attached" do
  end
  
  it "should not create a video without a name and an attached video" do
  end

  it "should list all videos given an user" do
  end  
end
