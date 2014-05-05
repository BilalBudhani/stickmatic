require "#{Rails.root}/lib/helpers/zipper"

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :ordered_packs
  has_many :packs, through: :ordered_packs
  has_many :addresses
  
  accepts_nested_attributes_for :ordered_packs

  after_save :perform_calc

  scope :unpaid, ->(user) { where(user: user, paid: false) }
  scope :paid, ->(user) { where(user: user, paid: true) }

  def self.add(pack)
    order = get_current_order(pack.user)
    order.ordered_packs.create(pack_id: pack.id, qty: 1)
    order.save
  end


  def self.remove(pack)
    order = get_current_order(pack.user)
    order.ordered_packs.destroy(pack_id: pack.id)
    order.save
  end

  def packs_count
    order = get_current_order(user)
    order.ordered_packs.count
  end

  def download_images!(zip_path)

    # FIXME Change to bg process
    self.packs.map(&:draw!)



    images = self.packs.map(&:collage_path)

    #FIXME PATH

    # add images to zip
    #
    #zip and send images
    Zipper.new.export(images,zip_path)

  end

  def calc_total_price
    self.ordered_packs.map(&:total_price).inject(:+)
  end

  def calc_qty
    self.ordered_packs.map(&:qty).inject(:+)
  end

  private

  def tmp_zip_path
    FileUtils.mkdir_p "#{Rails.root}/public/orders/#{self.id}"
    "#{Rails.root}/public/orders/#{self.id}/order_#{self.id}.zip"
  end



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


end
