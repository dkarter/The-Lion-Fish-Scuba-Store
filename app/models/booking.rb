class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :tour
  has_many :accounting_transactions

  attr_accessible :cc, :cc_exp_date, :cc_name, :ccv, :amount_paid, :cc_reference, :payment_status, :seats, :status, :customer_id, :tour_id
  accepts_nested_attributes_for :customer, :tour
  


  # Validations
  validates_presence_of :customer, :tour, :seats, :status, :payment_status, :amount_paid
  validates :seats, :numericality => { :only_integer => true, greater_than: 0 }
  validates :amount_paid, :numericality => { greater_than: 0 }
  #VALID_CC_REGEX = /^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$/
  validates :cc, length: { minimum: 12, maximum: 19 }, unless: "cc.blank?"
  validates :cc_name, length: { maximum: 30 }, format: { :with => /^[^0-9`!@#\$%\^&*+_=]+$/ }, unless: "cc_name.blank?"
  validates :ccv, length: { maximum: 4 }, unless: "ccv.blank?"
  validates :cc_exp_date, unless: "cc_exp_date.blank?", format: { with: /((0[1-9])|(1[0-2]))\/((20)(1([2-9])|([2-9])([0-9])))/ }



  # Named Scopes
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
