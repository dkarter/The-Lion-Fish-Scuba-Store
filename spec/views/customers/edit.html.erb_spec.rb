require 'spec_helper'

describe "customers/edit" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :name => "MyString",
      :email => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString",
      :cc => "MyString",
      :ccv => "MyString",
      :cc_name => "MyString",
      :cc_exp_date => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do
      assert_select "input#customer_name[name=?]", "customer[name]"
      assert_select "input#customer_email[name=?]", "customer[email]"
      assert_select "input#customer_address[name=?]", "customer[address]"
      assert_select "input#customer_city[name=?]", "customer[city]"
      assert_select "input#customer_state[name=?]", "customer[state]"
      assert_select "input#customer_zipcode[name=?]", "customer[zipcode]"
      assert_select "input#customer_cc[name=?]", "customer[cc]"
      assert_select "input#customer_ccv[name=?]", "customer[ccv]"
      assert_select "input#customer_cc_name[name=?]", "customer[cc_name]"
      assert_select "input#customer_cc_exp_date[name=?]", "customer[cc_exp_date]"
    end
  end
end
