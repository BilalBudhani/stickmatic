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
  end
end