require 'spec_helper'

describe PacksController do
  describe "when you is not logged in" do
    it "should redirect to main page" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "when user is logged in" do
    login_user
    it "should be able to access new" do
      get :new
      expect(response).to be_success
    end

    it "should be able to create new" do
      params = {
        pack: {
          pack_items_attributes: [
            { uid: '12345', image: '//image', thumb: '//thumb'},
            { uid: '12346', image: '//image2', thumb: '//thumb2'},
          ]
        }
      }
      lambda {
        expect { post :create, params }.to change(Pack, :count).by(1)
      }.should change(PackItem, :count).by(2)
      expect(response).to redirect_to basket_path
    end
  end
end