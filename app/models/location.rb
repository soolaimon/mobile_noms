class Location < ActiveRecord::Base
  belongs_to :truck
  validates :truck_id, presence: true
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode, if: :address_changed?

  attr_writer :address
  
  def address
    "#{street_address} #{street_address2} #{city}, #{state} #{zip}".titleize
  end

  def address_changed?
    (changed & [:street_address, :street_address2, :city, :state, :zip]).any?
  end

end

