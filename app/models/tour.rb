class Tour < ActiveRecord::Base
  attr_accessible :description, :duration, :location, :name, :price, :seats_available, :start_time, :status

  has_many :bookings

  # validators
  validates_presence_of :name, :duration, :location, :price, :seats_available, :start_time
  validates :duration, :numericality => { greater_than: 0 }
  validates :seats_available, :numericality => { only_integer: true, greater_than: 0 }
  #validates :start_time, format: { with: /(?=\d)^(?:(?!(?:10\D(?:0?[5-9]|1[0-4])\D(?:1582))|(?:0?9\D(?:0?[3-9]|1[0-3])\D(?:1752)))((?:0?[13578]|1[02])|(?:0?[469]|11)(?!\/31)(?!-31)(?!\.31)|(?:0?2(?=.?(?:(?:29.(?!000[04]|(?:(?:1[^0-6]|[2468][^048]|[3579][^26])00))(?:(?:(?:\d\d)(?:[02468][048]|[13579][26])(?!\x20BC))|(?:00(?:42|3[0369]|2[147]|1[258]|09)\x20BC))))))|(?:0?2(?=.(?:(?:\d\D)|(?:[01]\d)|(?:2[0-8])))))([-.\/])(0?[1-9]|[12]\d|3[01])\2(?!0000)((?=(?:00(?:4[0-5]|[0-3]?\d)\x20BC)|(?:\d{4}(?!\x20BC)))\d{4}(?:\x20BC)?)(?:$|(?=\x20\d)\x20))?((?:(?:0?[1-9]|1[012])(?::[0-5]\d){0,2}(?:\x20[aApP][mM]))|(?:[01]\d|2[0-3])(?::[0-5]\d){1,2})?$/ }

  # enum types
  STATUS_TYPES = [['Active', 1],
                  ['Cancelled', 2]]


  #named scopes
  default_scope order('start_time asc')
  scope :starting_at, lambda {|date = nil| where('start_time >= ?', date) }
  scope :ending_at, lambda {|date = nil| where('start_time <= ?', date) }

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

    bookings.each do |b|
      if b.is_active_paid?(price)
        # add refund transaction entry
        AccountingTransaction::refund_booking_transaction(b,'Owner')

        # make adjustment to bookings
        b.status = 2 # cancelled - refunded
        b.save

        amount_refunded += b.amount_paid
      end
    end
    self.status = 2

    self.save
    { :success => "Cancelled tour and refunded all bookings. Total refunded: $#{amount_refunded}" }
  end

  private

  def get_paid_active_bookings
    result = Array.new
    bookings.each { |b| result.push(b) if b.is_active_paid? }
    result
  end

  
end
