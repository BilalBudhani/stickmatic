require 'spec_helper'

describe Order do
  let(:order) { Order.new(build(:order).attributes)}

  it "should save valid object" do
    expect(order.save).to be_true
  end

  it "should not save without transaction_id" do
    order.transaction_id = nil
    expect(order).to be_invalid
  end

  it "should not save without action" do
    order.action = nil
    expect(order).to be_invalid
  end

  it "should not save without address" do
    order.address = nil
    expect(order).to be_invalid
  end

  it "should not save without user" do
    order.user_id = nil
    expect(order).to be_invalid
  end

  it { should belong_to(:user) }
  it { should belong_to(:address) }


  it { should have_many(:order_carts) }
  it { should have_many(:carts) }

end
