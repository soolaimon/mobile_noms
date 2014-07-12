class Truck < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_one :location
  validates :name, presence: true


  searchkick
  
end
