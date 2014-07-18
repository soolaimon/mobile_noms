class Truck < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  include PgSearch

  pg_search_scope :search, against: [:name, :food_type],
    associated_against: { location: [:street_address, :street_address2, :city, :state, :zip]}


  belongs_to :user
  after_create :create_location
  has_one :location, dependent: :destroy

  validates :name, :twitter_handle, presence: true

  private

  def create_location
    location = Location.new(truck_id: self.id)
    location.save
  end

end
