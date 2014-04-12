require 'spec_helper'

describe OrdersController do
  login_user
  context "when user access index" do
    before(:each) { FactoryGirl.create(:order, user: subject.current_user)}
    it "should be able to access" do
      get 'index'
      expect(response).to be_success
    end
  end
end
