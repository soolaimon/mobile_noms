require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "associations" do
    it { should belong_to :business }
  end
end
