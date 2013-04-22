class BookingsController < ApplicationController
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookings }
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.json
  def new
    @booking = Booking.new

    respond_to do |format|
      format.html {
        if request.fullpath.include?('bookings_modal')
          render action: 'new_from_modal', layout: false
        else
          render action: 'new'
        end
      }
      format.json { render json: @booking }
    end
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(params[:booking])

    booking_saved = @booking.save

    AccountingTransaction::paid_booking_transaction(@booking)

    respond_to do |format|
      if booking_saved
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render action: "new" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.json
  def update
    @booking = Booking.find(params[:id])

    is_payment = @booking.payment_status != 2 && params[:booking][:payment_status] == '2'

    booking_saved = @booking.update_attributes(params[:booking])

    if is_payment
      AccountingTransaction::paid_booking_transaction(@booking)
    end

    respond_to do |format|
      if booking_saved
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url }
      format.json { head :no_content }
    end
  end

  def cancel_booking
    @booking = Booking.find(params[:id])
    cancel_result = @booking.cancel_booking

    respond_to do |format|
      if cancel_result
        format.html { redirect_to bookings_path, 
          flash: { :success => "Booking Cancelled Successfully - #{@booking.get_status_name}" } }
      else
        format.html { redirect_to bookings_path, 
          flash: { :error => "Booking Cannot Be Cancelled At This Time" } }
      end
    end
  end
end
