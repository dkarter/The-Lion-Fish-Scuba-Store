require 'spec_helper'

describe "accounting_transactions/index" do
  before(:each) do
    assign(:accounting_transactions, [
      stub_model(AccountingTransaction,
        :balance => "9.99",
        :transaction_type => 1,
        :description => "Description"
      ),
      stub_model(AccountingTransaction,
        :balance => "9.99",
        :transaction_type => 1,
        :description => "Description"
      )
    ])
  end

  it "renders a list of accounting_transactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
