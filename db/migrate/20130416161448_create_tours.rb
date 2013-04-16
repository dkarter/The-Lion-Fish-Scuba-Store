class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
      t.string :location
      t.string :description
      t.datetime :start_time
      t.decimal :duration
      t.integer :seats_available
      t.decimal :price
      t.integer :status

      t.timestamps
    end
  end
end
