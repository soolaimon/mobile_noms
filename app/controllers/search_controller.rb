class SearchController < ApplicationController

  def index
    @text_results = Truck.search(params[:q])
    trucks_in_range(@text_results).compact

  end

  private

  def trucks_in_range(trucks)
    trucks.collect {|truck| truck if truck.location.distance_from([session[:latitude], session[:longitude]]) <= params[:distance].to_f}
  end

end
