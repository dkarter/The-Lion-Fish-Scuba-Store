class RenameAmountPayedInBookingsToAmountPaid < ActiveRecord::Migration
  def change
  	rename_column :bookings, :amount_payed, :amount_paid
  end
end