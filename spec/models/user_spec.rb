require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "is invalid without a provider" do
        expect(FactoryGirl.build(:user, provider: nil)).not_to be_valid
  end

  it "is invalid without a username" do
    expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
  end

  it "is invalid without a auth token" do
    expect(FactoryGirl.build(:user, token: nil)).not_to be_valid
  end

  it "has many carts"

end