class AccountingTransaction < ActiveRecord::Base
  attr_accessible :balance, :description, :transaction_type
  
  belongs_to :booking

  TRANSACTION_TYPES = [['CC Payment for Booking', 1],
	              	   ['Refund for Tour Price Decrease', 2],
	              	   ['Refund for Cancellation', 3]]

end
