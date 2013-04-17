class Tour < ActiveRecord::Base
  attr_accessible :description, :duration, :location, :name, :price, :seats_available, :start_time, :status

  STATUS_TYPES = [['Active', 1],
	               ['Cancelled', 2]]
end
