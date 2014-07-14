class LocationsController < ApplicationController
  respond_to :html, :json


  def show
    @location = Location.find(params[:id])
  end

  def update
    @location = Truck.find(params[:truck_id]).location
    @location.update_attributes(location_params)
    respond_with @location
  end

  private

  def location_params
    params.require(:location).permit(:street_address, :street_address2,
     :city, :state, :zip, :latitude, :longitude)
  end
end
