class TrucksController < ApplicationController
  before_action :ensure_user_is_logged_in
  before_action :get_times, only: [:new, :edit]
  before_action :get_truck, only: [:show, :edit, :update, :destroy]

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
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.user_id = current_user.id
    if @truck.save
      flash[:notice] = "Truck saved successfully"
      redirect_to trucks_path
    else
      flash[:alert] = "Failed to save truck"
      render :new
    end
  end

  def edit
  end

  def update
    if @truck.update_attributes(truck_params)
      flash[:notice] = "Truck saved successfully"
      redirect_to trucks_path
    else
      flash[:alert] = "Failed to save truck"
      render :edit
    end
  end

  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy
    redirect_to trucks_path
  end


  private

  def truck_params
    params.require(:truck).permit(:name, :food_type, :user_id, :description, :starts_at, :ends_at, :image)
  end

  def ensure_user_is_logged_in
    redirect_to root_path unless current_user
  end

  def get_truck
    @truck = Truck.find(params[:id])
  end

  def get_times
    @times = TrucksHelper::times
  end
end
