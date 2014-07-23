class SiteController < ApplicationController
  include Searching

  def index
    @title = 'Home'
    trucks = Truck.all
    @trucks = trucks_in_range(trucks, 20).compact if session[:latitude] && session[:longitude]
  end
end
