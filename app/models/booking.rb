class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :tour
  has_many :accounting_transactions

  attr_accessible :cc, :cc_exp_date, :cc_name, :ccv, :amount_paid, :cc_reference, :payment_status, :seats, :status, :customer_id, :tour_id
  accepts_nested_attributes_for :customer
  
  #scopes
  scope :by_tour, lambda { |t_id| where('tour_id = ?', t_id) }
  scope :by_customer, lambda { |c_id| where('customer_id = ?', c_id) }
  scope :made_profit, where(status: [1,3], payment_status: 2)
  scope :refunded, where(status: 2, payment_status: 2)
  scope :active_paid, where(status: 1, payment_status: 2)


  STATUS_TYPES = [['Active', 1], ['Cancelled - Refunded', 2], ['Cancelled - No Refund', 3]]
  PAYMENT_STATUS_TYPES = [['Not Paid', 1], ['Paid in Full', 2]]

  # Static Methods
  def self.get_total_paid_per_customer(c_id)
    paid = by_customer(c_id).made_profit.sum(:amount_paid)
    refunded = by_customer(c_id).refunded.sum(:amount_paid)
    paid - refunded
  end

  def self.get_seats_taken(t_id)
  	by_tour(t_id).active_paid.sum(:seats)
  end


  # Instance Methods
  def status_name
    ApplicationHelper::get_enum_name_by_value(STATUS_TYPES, status)
  end

  def payment_status_name
    ApplicationHelper::get_enum_name_by_value(PAYMENT_STATUS_TYPES, payment_status)
  end

  def is_active_paid?(price = nil)
    active_paid = status == 1 && payment_status == 2
    if price
      active_paid && amount_paid >= price
    else
      active_paid
    end
  end

  def cancel_booking(cancel_by = nil)
    days_to_cancel = APP_CONFIG['defaults']['days_to_cancel'].to_i
    days_passed = ((Time.now - tour.start_time) / 86400).floor.to_i
    
    #cannot cancel an already cancelled or used booking
    return false if status > 1 || days_passed >= 0

    if cancel_by == 'Owner' || days_passed <= days_to_cancel
      AccountingTransaction::refund_booking_transaction(self)
      self.status = 2
    else
      # cancel with no refund (just change booking status)
      self.status = 3
    end

    self.save
  end

end
