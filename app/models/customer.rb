class Customer < ActiveRecord::Base
  attr_accessible :address, :cc, :cc_exp_date, :cc_name, :ccv, :city, :email, :name, :state, :zipcode
  
  has_many :bookings

end
