class Product < ActiveRecord::Base

  # type which shows multiple images and single image
  PRODUCT_TYPES = [
    CLASSIC = 0,
    JIGSAW = 1
  ]

  validates :product_type , presence: true

  has_many :product_items , dependent: :destroy
  accepts_nested_attributes_for :product_items

  before_validation :save_product_type

  def price
    700
  end

  def save_product_type
    self.product_type ||=  CLASSIC
  end

end
