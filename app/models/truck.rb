class Truck < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  include PgSearch

  pg_search_scope :search, against: [:name, :food_type],
    associated_against: { location: [:street_address, :street_address2, :city, :state, :zip]}


  belongs_to :user
  after_create :create_location
  has_one :location, dependent: :destroy
  has_many :frequent_locations
  validates :name, :twitter_handle, presence: true

  accepts_nested_attributes_for :frequent_locations, allow_destroy: true, reject_if: :has_blank_attributes

  private

  def create_location
    location = Location.new(truck_id: self.id, latitude: 0.0, longitude: 0.0)
    location.save
  end



end
