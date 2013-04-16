require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :name => "Name",
        :email => "Email",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :cc => "Cc",
        :ccv => "Ccv",
        :cc_name => "Cc Name",
        :cc_exp_date => "Cc Exp Date"
      ),
      stub_model(Customer,
        :name => "Name",
        :email => "Email",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :cc => "Cc",
        :ccv => "Ccv",
        :cc_name => "Cc Name",
        :cc_exp_date => "Cc Exp Date"
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "Cc".to_s, :count => 2
    assert_select "tr>td", :text => "Ccv".to_s, :count => 2
    assert_select "tr>td", :text => "Cc Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cc Exp Date".to_s, :count => 2
  end
end
