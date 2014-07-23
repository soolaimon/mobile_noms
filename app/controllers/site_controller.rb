class SiteController < ApplicationController
  include Searching

  def index
    @title = 'Home'
    trucks = Truck.all
    @trucks = trucks.collect {|truck| truck if truck.location.distance_from([session[:latitude], session[:longitude]]) <= params[:distance].to_f}
  end
end
