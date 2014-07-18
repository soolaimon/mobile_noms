class SearchController < ApplicationController

  def index
    @results = Truck.search(params[:q])
  end
end
