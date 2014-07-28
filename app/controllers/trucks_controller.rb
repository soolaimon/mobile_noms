class TrucksController < ApplicationController
  before_action :ensure_user_is_logged_in, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :get_truck, only: [:show, :edit, :update, :destroy]
  before_action :get_times, only: [:new, :edit, :update, :create]
  before_action :yelp_truck, only: [:show]
  before_action :display_yelp_truck, only: [:show]

  def index
    @trucks = current_user.trucks
    @title = 'Trucks'

  end

  def show
    @title = 'Truck'
    @yelp_truck
    @display_yelp_truck

  end

  def new
    @truck = Truck.new
    @title = 'New Truck'
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

  def duplicate
    orig_truck = Truck.find(params[:id])
    @truck = orig_truck.dup
    @truck.name = "#{orig_truck.name} #{orig_truck.id + 1}"
    if @truck.save
      redirect_to edit_truck_path(@truck.id)
    end
  end

  def edit
    @title = 'Edit Truck'
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
    @truck.destroy
    redirect_to trucks_path
  end

  private

  def truck_params

    params.require(:truck).permit(:name, :food_type, :user_id, :description, :monday_open, :monday_close, :tuesday_open, :tuesday_close, :wednesday_open, :wednesday_close, :thursday_open, :thursday_close, :friday_open, :friday_close, :saturday_open, :saturday_close, :sunday_open, :sunday_close,
     :cash, :visa, :discover, :mastercard, :american_express, :image, :twitter_handle, :website)

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

  def yelp_truck
    if @truck.location.address
      @search = Yelp.client.search( @truck.location.address, { term: @truck.name, sort: 0 })
      @yelp_truck = @search.businesses.select{ |a| a.name.capitalize == @truck.name.capitalize}.first
    end
  end

  def display_yelp_truck
    if @yelp_truck.nil?
    else
      @yelp_image = @yelp_truck.rating_img_url
      @yelp_snippet = @yelp_truck.snippet_text
      @yelp_url = @yelp_truck.url
    end
  end

end
