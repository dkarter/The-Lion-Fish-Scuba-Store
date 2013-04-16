class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :cc
      t.string :ccv
      t.string :cc_name
      t.string :cc_exp_date

      t.timestamps
    end
  end
end
