require 'spec_helper'

describe Order do
  it { should belong_to(:user) }
  it { should have_many(:ordered_packs) }
  it { should have_many(:packs) }
  it { should have_many(:addresses) }
  
  # it {should validate_presence_of(:qty) }
  # it {should validate_presence_of(:total_price) }
  # it {should validate_presence_of(:paid) }


  context "when adding a pack" do
    let!(:pack) { FactoryGirl.create(:pack_with_items) }
    let!(:order) { FactoryGirl.create(:order, user: pack.user) }
    let!(:pack2) { FactoryGirl.create(:pack_with_items, user: pack.user) }

    it "should create new order and add pack" do
      Order.add(pack)
      order.reload
      expect(order.packs.first).to eq(pack)
      expect(order.total_price).to eq(pack.price)
      expect(order.qty).to eq 1
    end

    it "should increment packs count" do
      ordered_pack = FactoryGirl.create(:ordered_pack, order: order, pack: pack, qty: 2)
      Order.add(pack2)
      order.reload
      expect(order.packs.count).to eq 2
      expect(order.total_price).to eq((pack.price * ordered_pack.qty) + pack2.price)
    end
  end

  context "when user already have packs in order" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:pack) { FactoryGirl.create(:pack_with_items, user: user) }
    let!(:order) { FactoryGirl.create(:order, user: user) }
    let!(:ordered_pack) {FactoryGirl.create(:ordered_pack, order: order, pack: pack, qty: 2)}

    it "should give a user specific count" do
      order = Order.unpaid(user).first
      expect(order.packs_count).to eq 1
    end
  end
end
