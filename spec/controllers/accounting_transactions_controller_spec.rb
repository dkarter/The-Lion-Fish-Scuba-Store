require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AccountingTransactionsController do

  # This should return the minimal set of attributes required to create a valid
  # AccountingTransaction. As you add validations to AccountingTransaction, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "balance" => "9.99" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AccountingTransactionsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all accounting_transactions as @accounting_transactions" do
      accounting_transaction = AccountingTransaction.create! valid_attributes
      get :index, {}, valid_session
      assigns(:accounting_transactions).should eq([accounting_transaction])
    end
  end

  describe "GET show" do
    it "assigns the requested accounting_transaction as @accounting_transaction" do
      accounting_transaction = AccountingTransaction.create! valid_attributes
      get :show, {:id => accounting_transaction.to_param}, valid_session
      assigns(:accounting_transaction).should eq(accounting_transaction)
    end
  end

  describe "GET new" do
    it "assigns a new accounting_transaction as @accounting_transaction" do
      get :new, {}, valid_session
      assigns(:accounting_transaction).should be_a_new(AccountingTransaction)
    end
  end

  describe "GET edit" do
    it "assigns the requested accounting_transaction as @accounting_transaction" do
      accounting_transaction = AccountingTransaction.create! valid_attributes
      get :edit, {:id => accounting_transaction.to_param}, valid_session
      assigns(:accounting_transaction).should eq(accounting_transaction)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AccountingTransaction" do
        expect {
          post :create, {:accounting_transaction => valid_attributes}, valid_session
        }.to change(AccountingTransaction, :count).by(1)
      end

      it "assigns a newly created accounting_transaction as @accounting_transaction" do
        post :create, {:accounting_transaction => valid_attributes}, valid_session
        assigns(:accounting_transaction).should be_a(AccountingTransaction)
        assigns(:accounting_transaction).should be_persisted
      end

      it "redirects to the created accounting_transaction" do
        post :create, {:accounting_transaction => valid_attributes}, valid_session
        response.should redirect_to(AccountingTransaction.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved accounting_transaction as @accounting_transaction" do
        # Trigger the behavior that occurs when invalid params are submitted
        AccountingTransaction.any_instance.stub(:save).and_return(false)
        post :create, {:accounting_transaction => { "balance" => "invalid value" }}, valid_session
        assigns(:accounting_transaction).should be_a_new(AccountingTransaction)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AccountingTransaction.any_instance.stub(:save).and_return(false)
        post :create, {:accounting_transaction => { "balance" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested accounting_transaction" do
        accounting_transaction = AccountingTransaction.create! valid_attributes
        # Assuming there are no other accounting_transactions in the database, this
        # specifies that the AccountingTransaction created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AccountingTransaction.any_instance.should_receive(:update_attributes).with({ "balance" => "9.99" })
        put :update, {:id => accounting_transaction.to_param, :accounting_transaction => { "balance" => "9.99" }}, valid_session
      end

      it "assigns the requested accounting_transaction as @accounting_transaction" do
        accounting_transaction = AccountingTransaction.create! valid_attributes
        put :update, {:id => accounting_transaction.to_param, :accounting_transaction => valid_attributes}, valid_session
        assigns(:accounting_transaction).should eq(accounting_transaction)
      end

      it "redirects to the accounting_transaction" do
        accounting_transaction = AccountingTransaction.create! valid_attributes
        put :update, {:id => accounting_transaction.to_param, :accounting_transaction => valid_attributes}, valid_session
        response.should redirect_to(accounting_transaction)
      end
    end

    describe "with invalid params" do
      it "assigns the accounting_transaction as @accounting_transaction" do
        accounting_transaction = AccountingTransaction.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AccountingTransaction.any_instance.stub(:save).and_return(false)
        put :update, {:id => accounting_transaction.to_param, :accounting_transaction => { "balance" => "invalid value" }}, valid_session
        assigns(:accounting_transaction).should eq(accounting_transaction)
      end

      it "re-renders the 'edit' template" do
        accounting_transaction = AccountingTransaction.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AccountingTransaction.any_instance.stub(:save).and_return(false)
        put :update, {:id => accounting_transaction.to_param, :accounting_transaction => { "balance" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested accounting_transaction" do
      accounting_transaction = AccountingTransaction.create! valid_attributes
      expect {
        delete :destroy, {:id => accounting_transaction.to_param}, valid_session
      }.to change(AccountingTransaction, :count).by(-1)
    end

    it "redirects to the accounting_transactions list" do
      accounting_transaction = AccountingTransaction.create! valid_attributes
      delete :destroy, {:id => accounting_transaction.to_param}, valid_session
      response.should redirect_to(accounting_transactions_url)
    end
  end

end
