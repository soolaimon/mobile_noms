require 'rails_helper'

RSpec.describe SiteController, :type => :controller do

  describe "#index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
    # before do
    #   session[:latitude] = 40.7640595
    #   session[:longitude] = -111.9062905
    #   @l1 = create(:location, address: "Temple Square, Salt Lake City, UT")
    #   @l1 = create(:location, address: "Roosevelt, UT")
    # end

    # it "count of @trucks should be 1", :focus do
    #   get :index 
    #   expect(assigns(:trucks).count).to eq 1
    # end


  end

end
