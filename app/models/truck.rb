class Truck < ActiveRecord::Base
  belongs_to :business
  validates :business_id, :name, presence: true
end
