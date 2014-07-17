class LocationsController < ApplicationController
  respond_to :html, :json

  def show
    @location = Location.find(params[:id])   
  end

  def edit
   @location = Location.find(params[:id]) 
  end

  def update
    @location = Location.find(params[:id])
    respond_to do |format|
      if @location.update_attributes(location_params)
        format.html { redirect_to trucks_path }
        format.json{ render json: @location}
      end

    end
  end

  private

  def location_params
    params.require(:location).permit(:street_address, :street_address2,
     :city, :state, :zip, :latitude, :longitude)
  end
end
