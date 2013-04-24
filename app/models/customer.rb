class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :email, :name, :state, :zipcode
  
  has_many :bookings

  # Validations
  validates_presence_of :email, :name
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :address, length: { maximum: 70 }
  validates :city, length: { minimum: 2, maximum: 50 }, unless: "city.blank?"
  validates :state, length: { is: 2 }, unless: "state.blank?"
  validates :zipcode, length: { minimum: 5, maximum: 10 }, unless: "zipcode.blank?"


  # Named Scopes
  scope :by_email, lambda { |email| where('email like ?', "%#{email}%") }


  # Methods
  def self.search(email)
    if !email.blank?
      by_email(email)
    else
      find(:all)
    end
  end
end
