class Booking < ActiveRecord::Base
  attr_accessible :amount_payed, :cc_reference, :payment_status, :seats, :status
  
  belongs_to :customer
  belongs_to :tour
  has_many :accounting_transactions

end
