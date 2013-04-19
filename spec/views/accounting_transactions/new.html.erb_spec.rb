require 'spec_helper'

describe "accounting_transactions/new" do
  before(:each) do
    assign(:accounting_transaction, stub_model(AccountingTransaction,
      :balance => "9.99",
      :transaction_type => 1,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new accounting_transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", accounting_transactions_path, "post" do
      assert_select "input#accounting_transaction_balance[name=?]", "accounting_transaction[balance]"
      assert_select "input#accounting_transaction_transaction_type[name=?]", "accounting_transaction[transaction_type]"
      assert_select "input#accounting_transaction_description[name=?]", "accounting_transaction[description]"
    end
  end
end
