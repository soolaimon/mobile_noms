class FrequentLocationsController < ApplicationController

  def new
    @truck = Truck.find(params[:truck_id])
    @frequent_location = @truck.frequent_locations.new
  end

  def create
    @truck = Truck.find(params[:truck_id])
    @frequent_location = @truck.frequent_locations.new(frequent_location_params)
    if @frequent_location.save
      redirect_to edit_truck_location_path(@truck.id, @truck.location.id)
    else
      render :new
    end
  end

  private

  def frequent_location_params
    params.require(:frequent_location).permit(:address)
  end

end
