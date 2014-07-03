class Truck < ActiveRecord::Base
  belongs_to :businesses
  validates :business_id, presence: true
end
