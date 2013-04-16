require 'spec_helper'

describe "tours/index" do
  before(:each) do
    assign(:tours, [
      stub_model(Tour,
        :name => "Name",
        :location => "Location",
        :description => "Description",
        :duration => "9.99",
        :seats_available => 1,
        :price => "9.99",
        :status => 2
      ),
      stub_model(Tour,
        :name => "Name",
        :location => "Location",
        :description => "Description",
        :duration => "9.99",
        :seats_available => 1,
        :price => "9.99",
        :status => 2
      )
    ])
  end

  it "renders a list of tours" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
