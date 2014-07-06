class Truck < ActiveRecord::Base
  belongs_to :business
  validates :business_id, presence: true
end
