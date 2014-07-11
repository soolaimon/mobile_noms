class Location < ActiveRecord::Base
  belongs_to :truck
  geocoded_by :address
  after_validation :geocode
end
