class LocationsController < ApplicationController
  respond_to :html, :json
  before_action :get_location, only: [:show, :edit, :update]
  before_action :get_truck, only: [:edit]

  def show
  end

  def edit
   @frequent_location = @location.truck.frequent_locations
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
    render json: session[:latitude]
  end

  private

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end

  def get_location
    @location = Location.find(params[:id]) 
  end

  def get_truck
   @truck = Truck.find(params[:truck_id])
  end
end
