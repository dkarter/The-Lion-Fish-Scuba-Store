class MoveCcInfoToBookingInsteadOfCustomer < ActiveRecord::Migration
  def change
  	# first drop columns in customer
  	change_table :customers do |t|
      t.remove :cc
      t.remove :ccv
      t.remove :cc_name
      t.remove :cc_exp_date
    end

  	# second create columns in booking
  	change_table :bookings do |t|
      t.string :cc
      t.string :ccv
      t.string :cc_name
      t.string :cc_exp_date
    end
  end
end
