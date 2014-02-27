require 'spec_helper'

describe ProductItem do
  it "has a valid factory" do
    expect(FactoryGirl.create(:product_item)).to be_valid
  end

end