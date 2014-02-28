require 'spec_helper'

describe Cart do
  it { should belong_to(:user)}

  it "should save valid object" do
    cart = Cart.new(build(:cart).attributes)
    expect(cart.save).to be_true
  end


  it {should validate_presence_of :status}
  it "reset default tax pecent to zero" do
    expect(build(:cart).tax_pct).to eq(0)
  end


  it { should have_many(:order_carts) }
  it { should have_many(:orders) }

end