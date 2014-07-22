require 'rails_helper'

RSpec.describe Location, :type => :model do
  describe "#associations" do
    it {should belong_to :truck}
  end

  describe "#validations" do
    it {should validate_presence_of :truck_id}
  end

end
