class AccountingTransaction < ActiveRecord::Base
  attr_accessible :balance, :description, :transaction_type, :booking
  
  belongs_to :booking

  TRANSACTION_TYPES = [['CC Payment', 1],
	              	    ['Refund - Price Decrease', 2],
	              	    ['Refund - Cancellation', 3]]


  def get_transaction_type_name
    ApplicationHelper::get_enum_name_by_value(TRANSACTION_TYPES, transaction_type)
  end

  def self.paid_booking_transaction(booking)
    if booking.payment_status == 2 # paid in full
      description = "Payment by '#{booking.customer.name}' for '#{booking.tour.name}'"
      trans = AccountingTransaction.create(balance: booking.amount_paid, 
                                           booking: booking, 
                                           description: description,
                                           transaction_type: 1)

      trans.save
    end
  end

  def self.refund_booking_transaction(booking, cancel_by = nil)
    cancel_by = booking.customer.name if !cancel_by

    # verify paid in full and active booking
    if booking.payment_status == 2 && booking.status == 1
      description = "Cancellation by '#{cancel_by}' for '#{booking.tour.name}'"
      
      trans = AccountingTransaction.create(balance: (0 - booking.amount_paid), 
                                           booking: booking, 
                                           description: description,
                                           transaction_type: 3)

      trans.save
    end
  end

  def self.refund_booking_price_decrease_transaction(booking)
    if booking.payment_status == 2 # paid in full
      description = "Price decrease refund for: '#{booking.customer.name}' Tour: '#{booking.tour.name}'"
      trans = AccountingTransaction.create(balance: (0 - booking.amount_paid), 
                                           booking: booking, 
                                           description: description,
                                           transaction_type: 2)

      trans.save
    end
  end

end
