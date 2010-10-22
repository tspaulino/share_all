require 'spec_helper'

describe Image do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :author => "value for author",
      :user_id => 1,
      :image_file_name => "value for image_file_name",
      :image_content_type => "value for image_content_type",
      :image_file_size => 1,
      :image_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Image.create!(@valid_attributes)
  end 
  
  it "should contain a valid image format attached" do
  end
  
  it "should not create an image without a name and an attached image" do
  end
  
  it "should list all images given an user" do
  end                                             

end
