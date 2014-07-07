require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "associations" do
    it { should belong_to :business }
  end

  describe "validations", :focus do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end
end
