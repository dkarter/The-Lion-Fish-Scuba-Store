class CreateAccountingTransactions < ActiveRecord::Migration
  def change
    create_table :accounting_transactions do |t|
      t.decimal :balance
      t.integer :transaction_type
      t.string :description

      t.timestamps
    end
  end
end
