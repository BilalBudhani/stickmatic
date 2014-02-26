require 'spec_helper'

describe Product do
  it "has a valid factory" do
    expect(FactoryGirl.create(:product)).to be_valid
  end

  it "is invalid without a product_type" do
        expect(FactoryGirl.build(:product, product_type: nil)).not_to be_valid
  end

  it {should have_many(:product_items)}

end