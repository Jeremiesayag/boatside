class YachtsController < ApplicationController
  def index
    if params[:query].present?
      @yachts = Yacht.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @yachts = Yacht.all
    end
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
