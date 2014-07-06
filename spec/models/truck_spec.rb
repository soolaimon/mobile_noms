require 'rails_helper'

RSpec.describe Truck, :type => :model do
  describe "associations" do
    it { should belong_to :business }
  end

  describe "validations", :focus do
    it { should validate_presence_of :name }
    it { should validate_presence_of :business_id}
  end
end
