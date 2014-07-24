class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :update]
  respond_to :html, :json

  def show
  end

  def edit
   @frequent_location = @location.truck.frequent_locations
   @truck = Truck.find(params[:truck_id])
   @title = 'Edit Location'
  end

  def update
    respond_to do |format|
      if @location.update_attributes(location_params)
        format.html { redirect_to trucks_path }
        format.json{ render json: @location}
      end
    end
  end

  def current_location
    session[:latitude] = location_params[:latitude]
    session[:longitude] = location_params[:longitude]
    render json: session
  end

  private

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end

  def find_location
    @location = Location.find(params[:id])
  end
end
