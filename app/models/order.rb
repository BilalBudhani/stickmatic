class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_packs
  has_many :packs, through: :ordered_packs

  after_save :perform_calc

  def add(pack)
    self.ordered_packs.new(
      pack_id: pack.id,
      qty: 1
      )
  end

  private
  def perform_calc
    update_column(:total_price, calc_total_price)
    update_column(:qty, calc_qty)
  end

  def calc_total_price
    self.ordered_packs.map(&:total_price).inject(:+)
  end

  def calc_qty
    self.ordered_packs.map(&:qty).inject(:+)
  end
end
