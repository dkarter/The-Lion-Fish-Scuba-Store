require 'spec_helper'

describe "bookings/new" do
  before(:each) do
    assign(:booking, stub_model(Booking,
      :seats => 1,
      :status => 1,
      :payment_status => 1,
      :cc_reference => "MyString",
      :amount_payed => "9.99"
    ).as_new_record)
  end

  it "renders new booking form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bookings_path, "post" do
      assert_select "input#booking_seats[name=?]", "booking[seats]"
      assert_select "input#booking_status[name=?]", "booking[status]"
      assert_select "input#booking_payment_status[name=?]", "booking[payment_status]"
      assert_select "input#booking_cc_reference[name=?]", "booking[cc_reference]"
      assert_select "input#booking_amount_payed[name=?]", "booking[amount_payed]"
    end
  end
end
