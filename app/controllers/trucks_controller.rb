class TrucksController < ApplicationController
  # before_action :authenticate_user!, only: [:index]

  def index
    # Truck.reindex
    # puts "++++++++++++++++++++++++++++++++"
    # trucks = Truck.search "Cupbop"
    # trucks.each do |truck|
    #   puts "================#{truck.name}"
    # end

    
    @trucks = current_user.trucks
  end

  def show
    @truck = Truck.find(params[:id])
  end

  def new
    @truck = Truck.new
  end
end
