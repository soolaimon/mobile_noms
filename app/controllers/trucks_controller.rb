class TrucksController < ApplicationController
  before_action :ensure_user_is_logged_in, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :get_truck, only: [:show, :edit, :update, :destroy]
  before_action :get_times, only: [:new, :edit, :update, :create]

  def index
    @trucks = current_user.trucks
    @title = 'Trucks'

  end

  def show
    @title = 'Truck'
    # If there is an address for the Truck, run the Yelp search
    if @truck.location.address
      # Yelp search.
      @search = Yelp.client.search( @truck.location.address, { term: @truck.name, sort: 0 })
      # Set correct Truck
      # NOTE: @truck.name must match the Yelp name exactly.
      @yelp_truck = @search.businesses.select{ |a| a.name == @truck.name}.first
    end
    # Check to see if a truck is found
    if @yelp_truck.nil?
      # Does nothing
    else
      # Get the trucks image and snippet if they exist
      @yelp_image = @yelp_truck.rating_img_url
      @yelp_snippet = @yelp_truck.snippet_text
      @yelp_url = @yelp_truck.url
    end
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
