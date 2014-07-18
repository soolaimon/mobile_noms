class SearchController < ApplicationController

  def index

    binding.pry
    @text_results = Truck.search(params[:q])
    @results = trucks_in_range(@text_results)
  end

  private

  def trucks_in_range(trucks)
    trucks.collect {|truck| truck if truck.location.distance_from([session[:latitude], session[:longitude]]) <= params[:distance].to_f}
  end
end
