require 'spec_helper'

describe Cart do
  it { should belong_to(:user)}

  it "have may cart items"
  # do
    # should have_many(:cart_items)
  # end

  it {should validate_presence_of :status}
  it "reset default tax pecent to zero" do
    expect(build(:cart).tax_pct).to eq(0)
  end

end