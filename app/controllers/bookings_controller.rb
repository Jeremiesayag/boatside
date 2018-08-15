class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    # @booking = Booking.new
    # @yacht = Yacht.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.yacht = Yacht.find(params[:yacht_id])
    @booking.user = current_user

     if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to yacht_path(@booking.yacht)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user, :yacht)
  end

end
