require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without a provider" do
        FactoryGirl.build(:user, provider: nil).should_not be_valid
  end

  it "is invalid without a username" do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end

  it "is invalid without a auth token" do
    FactoryGirl.build(:user, token: nil).should_not be_valid
  end

  it "has many carts"
end