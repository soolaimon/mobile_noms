class TrucksController < ApplicationController
  # def index
  #   Truck.reindex
  #   puts "++++++++++++++++++++++++++++++++"
  #   trucks = Truck.search "Cupbop"
  #   trucks.each do |truck|
  #     puts "================#{truck.name}"
  #   end
  # end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.user_id = current_user.id
    if @truck.save
      redirect_to trucks_path
    else
      render :new
    end
  end

  private

  def truck_params
    params.require(:truck).permit(:name, :food_type, :user_id, :description, :starts_at, :ends_at)
  end
end
