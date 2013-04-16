class Tour < ActiveRecord::Base
  attr_accessible :description, :duration, :location, :name, :price, :seats_available, :start_time, :status
end
