require 'spec_helper'

describe "AccountingTransactions" do
  describe "GET /accounting_transactions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get accounting_transactions_path
      response.status.should be(200)
    end
  end
end
