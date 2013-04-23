class Tour < ActiveRecord::Base
  attr_accessible :description, :duration, :location, :name, :price, :seats_available, :start_time, :status

  has_many :bookings

  # validators
  validates_presence_of :name, :duration, :location, :price, :seats_available, :start_time
  

  # enum types
  STATUS_TYPES = [['Active', 1],
                  ['Cancelled', 2]]


  #named scopes
  default_scope order('start_time asc')
  scope :starting_at, lambda {|date = nil| where('start_time >= ?', date) }
  scope :ending_at, lambda {|date = nil| where('start_time <= ?', date) }
  #scope :paid_active_bookings, bookings.where('status')

  # Static Methods
  def self.search(starting_date, ending_date)
    if !starting_date.blank? && !ending_date.blank?
      starting_date = ApplicationHelper::normalize_date(starting_date)
      ending_date = ApplicationHelper::normalize_date(ending_date)

      starting_at(starting_date).ending_at(ending_date)
    else
      find(:all)
    end
  end

  def self.get_seats_remaining(t_id)
    seats_taken = Booking.get_seats_taken(t_id)
    seats_remaining = Tour.find(t_id).seats_available
    seats_remaining - seats_taken
  end


  # Public Instance Methods

  def status_name
    ApplicationHelper::get_enum_name_by_value(STATUS_TYPES, status)
  end

  def change_price(new_price)
    if price && new_price
      new_price = new_price.to_f
      amount_diff = price - new_price
      
      if price > new_price  
        bookings.each do |b|
          if b.is_active_paid?(price)
            # make adjustment to bookings
            b.amount_paid -= amount_diff
            b.save

            # add refund transaction entry
            AccountingTransaction::refund_booking_price_decrease_transaction(b)
          end
        end
      end

    end
  end

  def cancel_tour
    return { :error =>  "Tour already cancelled..." } if status == 2

    amount_refunded = 0
    bookings_refunded = 0

    bookings.each do |b|
      if b.is_active_paid?(price)
        # add refund transaction entry
        AccountingTransaction::refund_booking_transaction(b,'Owner')

        # make adjustment to bookings
        b.status = 2 # cancelled - refunded
        b.save

        amount_refunded += b.amount_paid
        bookings_refunded += 1
      end
    end
    self.status = 2

    self.save
    { :success => "Cancelled tour and refunded all bookings. Total refunded: $#{amount_refunded} for #{bookings_refunded}" }
  end

  private

  def get_paid_active_bookings
    result = Array.new
    bookings.each { |b| result.push(b) if b.is_active_paid? }
    result
  end

  
end
