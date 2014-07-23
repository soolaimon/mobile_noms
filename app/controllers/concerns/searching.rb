module Searching
  extend ActiveSupport::Concern

  def trucks_in_range(trucks, distance)
    if session[:latitude] && session[:longitude]
      trucks.collect {|truck| truck if truck.location.distance_from([session[:latitude], session[:longitude]]) <= distance.to_f}
    end
  end
end
