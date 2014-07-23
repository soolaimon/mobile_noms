module Searching
  extend ActiveSupport::Concern

  def trucks_in_range(trucks, distance)
    puts "IN SEARCHING***********************#{session[:latitude]}"
    puts "IN SEARCHING***********************#{session[:longitude]}"
    trucks.collect {|truck| truck if truck.location.distance_from([session[:latitude], session[:longitude]]) <= distance.to_f}
  end
end
