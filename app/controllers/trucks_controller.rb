class TrucksController < ApplicationController
  def index
    Truck.reindex
    trucks = Truck.search "cup"
    trucks.each do |truck|
      puts product.name
    end
  end
end
