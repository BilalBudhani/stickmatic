class Cart < ActiveRecord::Base
  acts_as_shopping_cart_using :line_item
  STATUS = [
    PENDING= 0,
    PROCESSED= 1
  ]

  belongs_to :user
  has_many :order_carts
  has_many :orders , through: :order_carts


  validates  :user, :status , presence: true

  def tax_pct
    0
  end

end