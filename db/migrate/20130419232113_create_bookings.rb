class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :seats
      t.integer :status
      t.integer :payment_status
      t.string :cc_reference
      t.decimal :amount_payed

      t.timestamps
    end
  end
end
