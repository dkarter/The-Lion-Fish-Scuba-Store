require 'spec_helper'

describe "customers/show" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zipcode/)
    rendered.should match(/Cc/)
    rendered.should match(/Ccv/)
    rendered.should match(/Cc Name/)
    rendered.should match(/Cc Exp Date/)
  end
end
