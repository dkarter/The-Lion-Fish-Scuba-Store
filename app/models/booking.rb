class Booking < ActiveRecord::Base
  attr_accessible :amount_payed, :cc_reference, :payment_status, :seats, :status, :customer_id, :tour_id
  
  belongs_to :customer
  belongs_to :tour
  has_many :accounting_transactions

  STATUS_TYPES = [['Active', 1], ['Cancelled-Refunded', 2], ['Cancelled-NoRefund', 3]]
  PAYMENT_STATUS_TYPES = [['Not Paid', 1], ['Paid in Full', 2]]
  


end
