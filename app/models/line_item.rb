class LineItem < ActiveRecord::Base
  acts_as_shopping_cart_item_for :cart

  validates_numericality_of :quantity, only_integer: true, greater_than: 0
end
