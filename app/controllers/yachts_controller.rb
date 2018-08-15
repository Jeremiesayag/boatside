class YachtsController < ApplicationController
  def index
    if params[:query].present?
      @yachts = Yacht.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @yachts = Yacht.all
    end
  end

  def show
    @booking = Booking.new
    @yacht = Yacht.find(params[:id])
  end

  def new
    @yacht = Yacht.new
  end

  def create
    @yacht = Yacht.new(yacht_params)
    @yacht.user = current_user

    if @yacht.save
     redirect_to yacht_path(@yacht)
   else
     render :new
   end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def yacht_params
    params.require(:yacht).permit(:name, :location, :photo, :boat_type)
  end
end
