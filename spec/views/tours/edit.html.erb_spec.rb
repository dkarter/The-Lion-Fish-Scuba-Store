require 'spec_helper'

describe "tours/edit" do
  before(:each) do
    @tour = assign(:tour, stub_model(Tour,
      :name => "MyString",
      :location => "MyString",
      :description => "MyString",
      :duration => "9.99",
      :seats_available => 1,
      :price => "9.99",
      :status => 1
    ))
  end

  it "renders the edit tour form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tour_path(@tour), "post" do
      assert_select "input#tour_name[name=?]", "tour[name]"
      assert_select "input#tour_location[name=?]", "tour[location]"
      assert_select "input#tour_description[name=?]", "tour[description]"
      assert_select "input#tour_duration[name=?]", "tour[duration]"
      assert_select "input#tour_seats_available[name=?]", "tour[seats_available]"
      assert_select "input#tour_price[name=?]", "tour[price]"
      assert_select "input#tour_status[name=?]", "tour[status]"
    end
  end
end
