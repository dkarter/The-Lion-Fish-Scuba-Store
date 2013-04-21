class AddKeys < ActiveRecord::Migration
  def change
    # the following commented lines are using the foriegner gem which doesn't seem to work
    # with my SQLite DB
    ###################
    # add_foreign_key "accounting_transactions", "bookings", :name => "accounting_transactions_booking_id_fk"
    # add_foreign_key "bookings", "customers", :name => "bookings_customer_id_fk"
    # add_foreign_key "bookings", "tours", :name => "bookings_tour_id_fk"
    
    change_table :accounting_transactions do |t|
  		t.references :booking, :foreign_key => true
	end

    change_table :bookings do |t|
  		t.references :customer, :foreign_key => true
  		t.references :tour, :foreign_key => true
	end
  end
end
