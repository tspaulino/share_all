require 'spec_helper'

describe "/albums/new.html.erb" do
  include AlbumsHelper

  before(:each) do
    assigns[:album] = stub_model(Album,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description",
      :user => 1
    )
  end

  it "renders new album form" do
    render

    response.should have_tag("form[action=?][method=post]", albums_path) do
      with_tag("input#album_name[name=?]", "album[name]")
      with_tag("textarea#album_description[name=?]", "album[description]")
      with_tag("input#album_user[name=?]", "album[user]")
    end
  end
end
