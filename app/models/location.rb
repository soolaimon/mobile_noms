class Location < ActiveRecord::Base

  belongs_to :truck
  validates :truck_id, presence: true
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, if: :coordinates_changed?
  after_validation :geocode, if: :address_changed?


  private

  def address_changed?
    (changed & ["address"]).any?
  end

  def coordinates_changed?
    (changed & ["latitude", "longitude"]).any?
  end

end
