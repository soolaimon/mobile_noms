module Searching
  extend ActiveSupport::Concern

  def trucks_in_range(trucks, distance)
    puts "IN SEARCHING***********************#{session[:latitude]}"
    puts "IN SEARCHING***********************#{session[:longitude]}"
    puts "IN SEARCHING***********************#{distance}"
    puts "IN SEARCHING***********************#{distance.to_f}"

    trucks.collect {|truck| truck if truck.location.distance_from([session[:latitude], session[:longitude]]) <= distance.to_f}
  end
end
