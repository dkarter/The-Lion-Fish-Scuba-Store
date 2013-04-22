class AccountingTransactionsController < ApplicationController
  # GET /accounting_transactions
  # GET /accounting_transactions.json
  def index
    @accounting_transactions = AccountingTransaction.all
    @sum_total = @accounting_transactions.sum(&:balance)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounting_transactions }
    end
  end

  # GET /accounting_transactions/1
  # GET /accounting_transactions/1.json
  def show
    @accounting_transaction = AccountingTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accounting_transaction }
    end
  end

  # GET /accounting_transactions/new
  # GET /accounting_transactions/new.json
  def new
    @accounting_transaction = AccountingTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accounting_transaction }
    end
  end

  # GET /accounting_transactions/1/edit
  def edit
    @accounting_transaction = AccountingTransaction.find(params[:id])
  end

  # POST /accounting_transactions
  # POST /accounting_transactions.json
  def create
    @accounting_transaction = AccountingTransaction.new(params[:accounting_transaction])

    respond_to do |format|
      if @accounting_transaction.save
        format.html { redirect_to @accounting_transaction, notice: 'Accounting transaction was successfully created.' }
        format.json { render json: @accounting_transaction, status: :created, location: @accounting_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @accounting_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounting_transactions/1
  # PUT /accounting_transactions/1.json
  def update
    @accounting_transaction = AccountingTransaction.find(params[:id])

    respond_to do |format|
      if @accounting_transaction.update_attributes(params[:accounting_transaction])
        format.html { redirect_to @accounting_transaction, notice: 'Accounting transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accounting_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_transactions/1
  # DELETE /accounting_transactions/1.json
  def destroy
    @accounting_transaction = AccountingTransaction.find(params[:id])
    @accounting_transaction.destroy

    respond_to do |format|
      format.html { redirect_to accounting_transactions_url }
      format.json { head :no_content }
    end
  end
  
end
