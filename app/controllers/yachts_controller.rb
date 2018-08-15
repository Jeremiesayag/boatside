class YachtsController < ApplicationController
  def index
    # Sets the condition to "all"/"none"
    @yachts = Yacht.where(nil)

    # If params[:location] is there, we add location as a condition
    @yachts = @yachts.where("location ILIKE ?", "%#{params[:location]}%") if params[:location].present?
    # If params[:boat_type] is there, we add boat_type as a condition
    @yachts = @yachts.where("boat_type ILIKE ?", "%#{params[:boat_type]}%") if params[:boat_type].present?

    # Calls "all" to make the query in the database
    @yachts = @yachts.all
  end

  def show
    @yacht = Yacht.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
