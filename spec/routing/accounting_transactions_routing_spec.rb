require "spec_helper"

describe AccountingTransactionsController do
  describe "routing" do

    it "routes to #index" do
      get("/accounting_transactions").should route_to("accounting_transactions#index")
    end

    it "routes to #new" do
      get("/accounting_transactions/new").should route_to("accounting_transactions#new")
    end

    it "routes to #show" do
      get("/accounting_transactions/1").should route_to("accounting_transactions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/accounting_transactions/1/edit").should route_to("accounting_transactions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/accounting_transactions").should route_to("accounting_transactions#create")
    end

    it "routes to #update" do
      put("/accounting_transactions/1").should route_to("accounting_transactions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/accounting_transactions/1").should route_to("accounting_transactions#destroy", :id => "1")
    end

  end
end
