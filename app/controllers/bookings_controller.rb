class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @bookings = Booking.find(params[:id])
  end

  def new
    @yacht = Booking.find(params[:yacht_id])
    @Booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # we need `restaurant_id` to asssociate booking with corresponding restaurant
    @booking.yacht = Yacht.find(params[:yacht_id])
    @booking.save
  end

  private

  def review_params
    params.require(:booking).permit(:start_date, :end_date, :user, :yacht)
  end

end
