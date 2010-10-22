require 'spec_helper'

describe Document do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :user_id => 1,
      :file_file_name => "value for file_file_name",
      :file_content_type => "value for file_content_type",
      :file_file_size => 1,
      :file_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Document.create!(@valid_attributes)
  end     
  
  it "should not create a document without a name or file" do
  end
    
  it "should list all documents given an user" do
  end                                             
  
  it "should contain a valid document format attached" do
  end
  
  it "should not create a document without a name and an attached file" do
  end
  
end
