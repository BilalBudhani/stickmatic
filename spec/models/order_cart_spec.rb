require 'spec_helper'

describe OrderCart do
  it "should save the record properly" do
    order_cart = FactoryGirl.build(:order_cart)
    order_cart.save!
    expect(OrderCart.first).to eq(order_cart)
  end

  
  it {should belong_to(:order)}

  it {should belong_to(:cart)}

end
