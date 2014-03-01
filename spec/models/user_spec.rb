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

  it {should have_many(:carts)}
  it {should have_many(:orders)}
  it {should have_many(:invitations)}
  it {should have_one(:invited_by)}


  it "should save the record properly" do
    user = FactoryGirl.build(:user)
    user.save!
    expect(User.first).to eq(user)
  end

  it "should have timestamp in proper format" do
    user = FactoryGirl.create(:user)
    expect(user[:created_at].to_date).to be_a(Date)
    expect(user[:updated_at].to_date).to be_a(Date)
  end

  it "is should have invitecode after create" do
    expect(FactoryGirl.create(:user).invite_code).to be_present
  end

end