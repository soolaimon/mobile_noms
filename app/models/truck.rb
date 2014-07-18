class Truck < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  after_create :create_location
  has_one :location, dependent: :destroy
  validates :name, :twitter_handle, presence: true
  # searchkick

  private

  def create_location
    location = Location.new(truck_id: self.id)
    location.save
  end

end
