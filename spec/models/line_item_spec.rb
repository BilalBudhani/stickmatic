require 'spec_helper'

describe LineItem do
  it "has a valid factory" do
    expect(FactoryGirl.create(:line_item)).to be_valid
  end

  it "should have minimun 1 quantity" do
    expect(FactoryGirl.build(:line_item, quantity: 0)).to be_invalid
  end


end