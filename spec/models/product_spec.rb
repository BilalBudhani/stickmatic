require 'spec_helper'

describe Product do
  it "has a valid factory" do
    expect(FactoryGirl.create(:product)).to be_valid
  end

  it "is invalid without a product_type" do
        expect(FactoryGirl.build(:product, product_type: nil)).not_to be_valid
  end

  it {should have_many(:product_items)}

  describe "classic type" do
    let(:product) {create(:product_with_product_items)}

    it "has 9 product_items" do
      expect(product.product_items.count).to eq(9)
    end
  end

end