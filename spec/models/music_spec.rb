require 'spec_helper'

describe Music do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :author => "value for author",
      :user_id => 1,
      :music_file_name => "value for music_file_name",
      :music_content_type => "value for music_content_type",
      :music_file_size => 1,
      :music_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Music.create!(@valid_attributes)
  end     
  
  it "should contain a valid music format attached" do
  end
  
  it "should not create a music without a name and an attached music" do
  end                                                               

  it "should list all musics given an user" do
  end
end
