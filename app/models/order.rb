class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_packs
  has_many :packs, through: :ordered_packs
  has_many :addresses
  
  accepts_nested_attributes_for :ordered_packs

  after_save :perform_calc

  scope :unpaid, ->(user) { where(user: user, paid: false) }

  def self.add(pack)
    order = get_current_order(pack.user)
    order.ordered_packs.create(pack_id: pack.id, qty: 1)
    order.save
  end

  def packs_count
    order = get_current_order(user)
    order.ordered_packs.count
  end

  private

  def get_current_order(user)
    order = Order.unpaid(user).first
    unless order
      order = Order.create(user: user, total_price: 0, qty: 0, paid: false)
    end
    order
  end

  # FIXME: This needs to be fixed in next refactoring
  def self.get_current_order(user)
    order = Order.unpaid(user).first
    unless order
      order = Order.create(user: user, total_price: 0, qty: 0, paid: false)
    end
    order
  end

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
