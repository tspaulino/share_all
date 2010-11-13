require 'spec_helper'

describe "/albums/edit.html.erb" do
  include AlbumsHelper

  before(:each) do
    assigns[:album] = @album = stub_model(Album,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description",
      :user => 1
    )
  end

  it "renders the edit album form" do
    render

    response.should have_tag("form[action=#{album_path(@album)}][method=post]") do
      with_tag('input#album_name[name=?]', "album[name]")
      with_tag('textarea#album_description[name=?]', "album[description]")
      with_tag('input#album_user[name=?]', "album[user]")
    end
  end
end
