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

    it "should list all lthe trucks for the user" do
      get :index
      expect(response).to be_success
      expect(assigns(:trucks).count).to eq 3
      expect(response).to render_template('index')
    end

    after do
      sign_out @user
    end
  end

  describe "#show" do
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
    before do
      @user = create(:user)
      @user.confirm!
      sign_in @user
    end
    it "should create a new instance of truck" do
      get :new
      expect(response).to be_success
      expect(assigns(:truck)).to be_new_record
      expect(response).to render_template('new')
    end
  end

  describe "#create" do

    before do
      @user = create(:user)
      @user.confirm!
      sign_in @user
    end

    context "when saving a proper record" do
      it "creates a new truck and saves it to DB" do
        expect {
          post :create, truck: {user_id: @user.id, name: "Pizza", twitter_handle: "test"}
        }.to change(Truck, :count).by(1)
      end
    end

    context "when failing to save record" do
      it "renders new template and doesn't save truck to db" do
        post :create, truck: {name: nil}
        expect(response).to render_template('new')
        expect(Truck.count).to eq 0
      end
    end
  end

  describe "#edit" do
    before do
      @user = create(:user)
      @user.confirm!
      sign_in @user
      @truck = create(:truck, user_id: @user.id)
    end

    it "displays the edit page for the truck i want to edit" do
      get :edit, id: @truck.id
      expect(response).to be_success
      expect(assigns(:truck).id).to eq @truck.id
      expect(response).to render_template('edit')
    end
  end

  describe "#update" do
    before do
      @user = create(:user)
      @user.confirm!
      sign_in @user
      @truck = create(:truck, name: "old", user_id: @user.id)
    end
    context "when saving truck to db successfully" do
      it "should change truck name to 'new' and redirect to truck path" do
        put :update, id: @truck.id, truck: {name: 'new'}
        expect(@truck.reload.name).to eq 'new'
        expect(response).to be_redirect
        expect(response).to redirect_to trucks_path
      end
    end
    context "when failing to save truck" do
      it "should not change the truck name and should render :edit" do
        put :update, id: @truck.id, truck: {name: nil}
        expect(@truck.reload.name).to eq 'old' 
        expect(response).to render_template(:edit) 
      end
    
    end
  end

    describe '#destroy' do
      before do
          @user = create(:user)
          sign_in @user
          @user.confirm!
          @truck = create(:truck, user_id: @user.id)
      end
      it 'removes the truck from the database' do
        expect {
          delete :destroy, id: @truck.id
        }.to change(Truck, :count).from(1).to(0)
        expect(response).to be_redirect
        expect(response).to redirect_to trucks_path
      end
    end
end
