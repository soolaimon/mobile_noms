require 'rails_helper'

RSpec.describe Truck, :type => :model do
  describe "associations" do
    it { should belong_to :business }
  end
end
