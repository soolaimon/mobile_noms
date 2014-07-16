class Location < ActiveRecord::Base
  belongs_to :truck
  validates :truck_id, presence: true
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.street_address = geo.street_address
      obj.city           = geo.city
      obj.state          = geo.state
      obj.zip            = geo.postal_code
    end
  end
  after_validation :reverse_geocode, if: :coordinates_changed?
  after_validation :geocode, if: :address_changed?



  attr_writer :address
  
  def address
    "#{street_address} #{street_address2} #{city}, #{state} #{zip}".titleize
  end


  private

  def address_changed?
    (changed & ["street_address", "street_address2", "city", "state", "zip"]).any?
  end

  def coordinates_changed?
    (changed & ["latitude", "longitude"]).any?
  end

end

