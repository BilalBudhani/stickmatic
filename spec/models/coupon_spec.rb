require 'spec_helper'

describe Coupon do
	it "has a valid factory" do
		expect(FactoryGirl.create(:coupon)).to be_valid
	end

  it "should have coupon code" do
    expect(FactoryGirl.build(:coupon,code: nil)).to be_invalid
  end


  it "should have amount or percent" do
    expect(FactoryGirl.build(:coupon,amount: nil,percent: nil)).to be_invalid
  end
end
