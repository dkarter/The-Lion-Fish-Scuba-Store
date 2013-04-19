require 'spec_helper'

describe "bookings/show" do
  before(:each) do
    @booking = assign(:booking, stub_model(Booking,
      :seats => 1,
      :status => 2,
      :payment_status => 3,
      :cc_reference => "Cc Reference",
      :amount_payed => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Cc Reference/)
    rendered.should match(/9.99/)
  end
end
