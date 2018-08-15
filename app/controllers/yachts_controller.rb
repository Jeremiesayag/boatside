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
    find_yacht
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
    find_yacht
    @yacht.update
  end

  def update
    find_yacht
    @yacht.update(yacht_params)
    redirect_to yachts_path(@yacht)
  end

  def destroy
    find_yacht
    @yacht.destroy
    redirect_to yachts_path
  end

  private

  def find_yacht
    @yacht = Yacht.find(params[:id])
  end

  def yacht_params
    params.require(:yacht).permit(:name, :location, :photo, :boat_type)
  end
end
