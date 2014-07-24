class FrequentLocationsController < ApplicationController

  def new
    @frequent_location = Truck.find(params[:truck_id]).frequent_locations.new
  end

  def create
    @frequent_location = Truck.find(params[:truck_id]).frequent_locations.new(frequent_location_params)
    if @frequent_location.save
      redirect_to edit_truck_location_path(@frequent_location.truck.id, @frequent_location.truck.location.id)
    else
      render :new
    end
  end

  private

  def frequent_location_params
    params.require(:frequent_location).permit(:address)
  end

end
