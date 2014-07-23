class LocationsController < ApplicationController
  respond_to :html, :json

  def show
    @location = Location.find(params[:id])
  end

  def edit
   @location = Location.find(params[:id])
   @frequent_location = @location.truck.frequent_locations
   @truck = Truck.find(params[:truck_id])
   @title = 'Edit Location'
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

  def current_location
    puts "*******************#{session[:latitude]}"
    puts "*******************#{session[:longitude]}"
    session[:latitude] = location_params[:latitude]
    session[:longitude] = location_params[:longitude]
    puts "**********************#{session[:latitude]}"
    puts "**********************#{session[:longitude]}"
    render json: session
  end

  private

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end
end
