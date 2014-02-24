class Product < ActiveRecord::Base

  # for staus denoting product paid or not
  STATUS = [
    PENDING = 0,
    CONFIRMED = 1
  ]

  # type which shows multiple images and single image
  PRODUCT_TYPES = [
    COLLAGE = 0,
    JIGSAW = 1
  ]

  belongs_to :user
  has_many :product_items , dependent: :destroy
  accepts_nested_attributes_for :product_items

  def price
    700
  end

end
