require 'spec_helper'

describe "tours/show" do
  before(:each) do
    @tour = assign(:tour, stub_model(Tour,
      :name => "Name",
      :location => "Location",
      :description => "Description",
      :duration => "9.99",
      :seats_available => 1,
      :price => "9.99",
      :status => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Location/)
    rendered.should match(/Description/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/9.99/)
    rendered.should match(/2/)
  end
end
