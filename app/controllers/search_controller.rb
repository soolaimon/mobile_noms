class SearchController < ApplicationController
  include Searching

  def index
    @title = 'Results'
    @text_results = Truck.search(params[:q])
    @results = trucks_in_range(@text_results, params[:distance]).compact
  end


end
