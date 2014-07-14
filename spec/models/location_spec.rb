require 'rails_helper'

RSpec.describe Location, :type => :model do
  describe "#associations" do
    it {should belong_to :truck}
  end

  describe "#validations" do
    it {should validate_presence_of :truck_id}
  end

  describe "#address" do
    before do
      @location = create(:location, street_address: "813 melrose terrace",
       street_address2: "apt 23", city: "Newport News", state: "Virginia", zip: "23608")
    end
    it "should return 813 melrose terrace apt 23 Newport News, Virginia 23608" do
      expect(@location.address).to eq "813 Melrose Terrace Apt 23 Newport News, Virginia 23608" 
    end
  end
end
