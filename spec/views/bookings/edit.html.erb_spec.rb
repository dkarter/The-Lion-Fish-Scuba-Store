require 'spec_helper'

describe "bookings/edit" do
  before(:each) do
    @booking = assign(:booking, stub_model(Booking,
      :seats => 1,
      :status => 1,
      :payment_status => 1,
      :cc_reference => "MyString",
      :amount_payed => "9.99"
    ))
  end

  it "renders the edit booking form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", booking_path(@booking), "post" do
      assert_select "input#booking_seats[name=?]", "booking[seats]"
      assert_select "input#booking_status[name=?]", "booking[status]"
      assert_select "input#booking_payment_status[name=?]", "booking[payment_status]"
      assert_select "input#booking_cc_reference[name=?]", "booking[cc_reference]"
      assert_select "input#booking_amount_payed[name=?]", "booking[amount_payed]"
    end
  end
end
