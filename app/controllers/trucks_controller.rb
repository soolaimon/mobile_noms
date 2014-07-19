class TrucksController < ApplicationController
  before_action :ensure_user_is_logged_in, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :get_truck, only: [:show, :edit, :update, :destroy]
  before_action :get_times, only: [:new, :edit, :update, :create]

  def index
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

    params.require(:truck).permit(:name, :food_type, :user_id, :description, :monday_open, :monday_close, :tuesday_open, :tuesday_close, :wednesday_open, :wednesday_close, :thursday_open, :thursday_close, :friday_open, :friday_close, :saturday_open, :saturday_close, :sunday_open, :sunday_close,
     :cash, :visa, :discover, :mastercard, :american_express, :image, :twitter_handle)

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
