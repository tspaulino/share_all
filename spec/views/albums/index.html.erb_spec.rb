require 'spec_helper'

describe "/albums/index.html.erb" do
  include AlbumsHelper

  before(:each) do
    assigns[:albums] = [
      stub_model(Album,
        :name => "value for name",
        :description => "value for description",
        :user => 1
      ),
      stub_model(Album,
        :name => "value for name",
        :description => "value for description",
        :user => 1
      )
    ]
  end

  it "renders a list of albums" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
