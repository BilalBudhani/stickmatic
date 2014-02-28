require 'spec_helper'

describe Address do
  it "should save valid object" do
    address = Address.new build(:address).attributes
    expect(address.save).to be_true
  end

  it "should not save without pincode" do
    address = Address.new build(:address, pincode: nil).attributes
    expect(address).to be_invalid
  end

  it "should not save without country" do
    address = Address.new build(:address, country: nil).attributes
    expect(address).to be_invalid
  end

  it "should not save without street" do
    address = Address.new build(:address, street: nil).attributes
    expect(address).to be_invalid
  end
end
