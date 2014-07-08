class Truck < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true

  searchkick

  mount_uploader :image, ImageUploader
end
