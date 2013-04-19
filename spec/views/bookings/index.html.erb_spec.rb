require 'spec_helper'

describe "bookings/index" do
  before(:each) do
    assign(:bookings, [
      stub_model(Booking,
        :seats => 1,
        :status => 2,
        :payment_status => 3,
        :cc_reference => "Cc Reference",
        :amount_payed => "9.99"
      ),
      stub_model(Booking,
        :seats => 1,
        :status => 2,
        :payment_status => 3,
        :cc_reference => "Cc Reference",
        :amount_payed => "9.99"
      )
    ])
  end

  it "renders a list of bookings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Cc Reference".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
