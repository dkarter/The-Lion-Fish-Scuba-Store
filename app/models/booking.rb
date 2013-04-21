class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :tour
  has_many :accounting_transactions

  attr_accessible :cc, :cc_exp_date, :cc_name, :ccv, :amount_payed, :cc_reference, :payment_status, :seats, :status, :customer_id, :tour_id
  accepts_nested_attributes_for :customer
  
  scope :bookings_by_tour, lambda { |t_id| where('tour_id = ?', t_id) }

  STATUS_TYPES = [['Active', 1], ['Cancelled-Refunded', 2], ['Cancelled-NoRefund', 3]]
  PAYMENT_STATUS_TYPES = [['Not Paid', 1], ['Paid in Full', 2]]

  def self.get_seats_taken(t_id)
  	bookings_by_tour(t_id).sum(:seats)
  end

  def self.get_status_name(value)
    ApplicationHelper::get_enum_name_by_value(STATUS_TYPES, value)
  end

  def self.get_payment_status_name(value)
    ApplicationHelper::get_enum_name_by_value(PAYMENT_STATUS_TYPES, value)
  end
end
