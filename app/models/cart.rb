class Cart < ActiveRecord::Base
  acts_as_shopping_cart_using :cart_item
  STATUS = [
    PENDING= 0,
    PROCESSED= 1
  ]

  belongs_to :user

  validates  :user, :status , presence: true

  def tax_pct
    0
  end

end