require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do

  describe "#update" do
    before do
      @location = create(:location)
    end

    context "when saving properly", :focus do
      it "should change the value of the locations latitude to 30.2 and longitude to 40.222" do
        put :update, id: @location.id, truck_id: @location.truck.id, location: {latitude: 30.2, longitude: 40.222}
        expect(@location.reload.latitude).to eq 30.2
        expect(@location.reload.longitude).to eq 40.222
      end
    end
  end


end
