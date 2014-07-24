class SiteController < ApplicationController
  include Searching

  def index
    @title = 'Home'
    trucks = Truck.all
    if session[:latitude] != nil && session[:longitude] != nil
      @trucks = trucks_in_range(trucks, 20).compact
    end
  end
end
