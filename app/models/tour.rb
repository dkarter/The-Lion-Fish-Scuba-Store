class Tour < ActiveRecord::Base
  attr_accessible :description, :duration, :location, :name, :price, :seats_available, :start_time, :status

  has_many :bookings

  STATUS_TYPES = [['Active', 1],
                  ['Cancelled', 2]]


  #named scopes
  default_scope order('start_time asc')
  scope :starting_at, lambda {|date = nil| where('start_time >= ?', date) }
  scope :ending_at, lambda {|date = nil| where('start_time <= ?', date) }

  def self.search(starting_date, ending_date)
    if !starting_date.blank? && !ending_date.blank?
      date_format = "%m/%d/%Y"
      starting_date = Date.strptime(starting_date, date_format)
      ending_date = Date.strptime(ending_date, date_format)

      starting_at(starting_date).ending_at(ending_date)
    else
      find(:all)
    end
  end

  def self.get_status_type_str(value)
    temp = STATUS_TYPES.select{ |x| x[1] == value }.first
    temp ? temp.first : 'Error'
  end
end
