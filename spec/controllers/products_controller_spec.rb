require 'spec_helper'

describe ProductsController do
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

    it "should be able to create product" do
      cart = double(Cart, :add => true)
      expect(cart).to have_received(:add)
      expect { post :create }.to change(Product, :count).by(1)
    end
  end
end