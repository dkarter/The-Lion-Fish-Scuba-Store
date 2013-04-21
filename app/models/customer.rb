class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :email, :name, :state, :zipcode
  
  has_many :bookings

end
