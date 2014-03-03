require 'spec_helper'

describe Order do
  it { should belong_to(:user) }
  it { should have_many(:ordered_packs) }
  it { should have_many(:packs) }

  # it {should validate_presence_of(:qty) }
  # it {should validate_presence_of(:total_price) }
  # it {should validate_presence_of(:paid) }


  describe "when adding a pack" do
    let!(:pack) { FactoryGirl.create(:pack_with_items) }
    let!(:order) { FactoryGirl.create(:order, user: pack.user) }
    let!(:pack2) { FactoryGirl.create(:pack_with_items, user: pack.user) }

    it "should create new order and add pack" do
      order = Order.new
      order.add(pack)
      order.save!
      expect(order.packs.first).to eq(pack)
      expect(order.total_price).to eq(pack.price)
      expect(order.qty).to eq 1
    end

    it "should increment packs count" do
      ordered_pack = FactoryGirl.create(:ordered_pack, order: order, pack: pack, qty: 2)
      order.reload
      order.add(pack2)
      order.save!
      expect(order.packs.count).to eq 2
      expect(order.total_price).to eq((pack.price * ordered_pack.qty) + pack2.price)
    end
  end
end
