require 'spec_helper'

describe "accounting_transactions/edit" do
  before(:each) do
    @accounting_transaction = assign(:accounting_transaction, stub_model(AccountingTransaction,
      :balance => "9.99",
      :transaction_type => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit accounting_transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", accounting_transaction_path(@accounting_transaction), "post" do
      assert_select "input#accounting_transaction_balance[name=?]", "accounting_transaction[balance]"
      assert_select "input#accounting_transaction_transaction_type[name=?]", "accounting_transaction[transaction_type]"
      assert_select "input#accounting_transaction_description[name=?]", "accounting_transaction[description]"
    end
  end
end
