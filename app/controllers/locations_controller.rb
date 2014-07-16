class LocationsController < ApplicationController
  respond_to :html, :json


  def show
    @location = Location.find(params[:id])
  end

  def edit
   @location = Location.find(params[:id]) 
  end

  def update
    @location = Truck.find(params[:truck_id]).location
    respond_to do |format|
      if @location.update_attributes(location_params)
        # binding.pry
        format.html { redirect_to trucks_path }
        format.json{ render json: @location}
      else
        render "trucks/index"
      end

    end
  end

  private

  def location_params
    params.require(:location).permit(:street_address, :street_address2,
     :city, :state, :zip, :latitude, :longitude)
  end
end
