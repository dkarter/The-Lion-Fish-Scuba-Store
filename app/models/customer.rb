class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :email, :name, :state, :zipcode
  
  has_many :bookings

  scope :by_email, lambda { |email| where('email like ?', "%#{email}%") }

  def self.search(email)
    if !email.blank?
      by_email(email)
    else
      find(:all)
    end
  end
end
