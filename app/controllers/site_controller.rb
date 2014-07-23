class SiteController < ApplicationController
  include Searching

  def index
    @title = 'Home'
    @trucks = Truck.all
  end
end
