require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do

  describe "#edit" do
    before do
      @location = create(:location)
    end

    it "should render a form for the location I want to edit" do
      get :edit, truck_id: @location.truck.id, id: @location.id
      expect(response).to be_success
      expect(assigns(:location).id).to eq @location.id  
      expect(response).to render_template('edit') 
    end
  end

  describe "#update", :focus do
    before do
      @location = create(:location)
    end

    context "when saving properly" do
      it "should change the value of the locations latitude to 30.2 and longitude to 40.222" do
        put :update, id: @location.id, truck_id: @location.truck.id, location: {latitude: 30.2, longitude: 40.222}
        expect(@location.reload.latitude).to eq 30.2
        expect(@location.reload.longitude).to eq 40.222
      end
    end
  end


end
