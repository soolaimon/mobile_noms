class Truck < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  mount_uploader :image, ImageUploader
end
