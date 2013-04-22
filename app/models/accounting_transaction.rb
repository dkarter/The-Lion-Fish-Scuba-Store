class AccountingTransaction < ActiveRecord::Base
  attr_accessible :balance, :description, :transaction_type, :booking
  
  belongs_to :booking

  TRANSACTION_TYPES = [['CC Payment for Booking', 1],
	              	    ['Refund for Tour Price Decrease', 2],
	              	    ['Refund for Cancellation', 3]]

  def self.get_transaction_type_name(value)
    ApplicationHelper::get_enum_name_by_value(TRANSACTION_TYPES, value)
  end

  def self.new_booking_transaction(booking)
    if booking.payment_status == 2 # paid in full
      description = "Payment by '#{booking.customer.name}' for '#{booking.tour.name}'"
      trans = AccountingTransaction.create(balance: booking.amount_paid, 
                                           booking: booking, 
                                           description: description,
                                           transaction_type: 1)

      trans.save
    end
  end
end
