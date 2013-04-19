require 'spec_helper'

describe "accounting_transactions/show" do
  before(:each) do
    @accounting_transaction = assign(:accounting_transaction, stub_model(AccountingTransaction,
      :balance => "9.99",
      :transaction_type => 1,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/Description/)
  end
end
