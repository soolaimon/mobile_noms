class Truck < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  validates :name, presence: true

  searchkick
  
end
