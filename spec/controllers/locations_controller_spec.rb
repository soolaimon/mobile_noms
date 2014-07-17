require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do

  describe "#show" do
    before do
      @location = create(:location)
    end
    it "should show render the json for the location I selected" do
      get :show, truck_id: @location.truck.id, id: @location.id, format: :json
      expect(assigns(:location).id).to eq @location.id    
      expect(response).to render_template('show')
    end
  end

  describe "#edit" do
    before do
      expect(response).to be_success 
      @location = create(:location)
    end

    it "should render a form for the location I want to edit" do
      get :edit, truck_id: @location.truck.id, id: @location.id
      expect(response).to be_success
      expect(assigns(:location).id).to eq @location.id  
      expect(response).to render_template('edit') 
    end
  end

  describe "#update" do
    before do
      @location = create(:location)
    end

    context "when saving properly" do
      it "should change the value of the locations latitude to 30.2 and longitude to 40.222" do
        put :update, id: @location.id, truck_id: @location.truck.id, location: {latitude: 30.1223286, longitude: 40.185467}
        expect(@location.reload.latitude).to eq 30.1223286
        expect(@location.reload.longitude).to eq 40.185467
      end
    end
  end
end
