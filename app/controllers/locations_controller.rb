class LocationsController < ApplicationController

  def show
    @location = Truck.find(params[:truck_id]).location
  end

end
