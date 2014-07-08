require 'rails_helper'
# include Devise::TestHelpers

RSpec.describe TrucksController, :type => :controller do
  describe "#index" do


    before do
      @user = create(:user)
      @user.confirm!
      sign_in @user
      @truck1 = create(:truck, user_id: @user.id)
      @truck2 = create(:truck, user_id: @user.id)
      @truck3 = create(:truck, user_id: @user.id)
      @other_truck = (:truck)
    end

    it "should list al lthe trucks for the user" do
      get :index
      expect(response).to be_success
      expect(assigns(:trucks).count).to eq 3
      expect(response).to render_template('index') 
    end

    after do
      sign_out @user
    end
  end

  describe "#show", :focus do
    before do
      @user = create(:user)
      @user.confirm!
      sign_in @user
      @truck = create(:truck, user_id: @user.id)
    end
    it 'displays a single truck' do 
      get :show, id: @truck.id
      expect(response).to be_success
      expect(assigns(:truck).user_id).to eq @user.id 
      expect(response).to render_template('show')
    end
  end

  describe "#new" do
    it "should create a new instance of truck" do
      get :new
      expect(response).to be_success 
      expect(assigns(:truck)).to be_new_record 
      expect(response).to render_template('new') 
    end
  end

end
