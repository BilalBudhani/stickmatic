FactoryGirl.define do
  factory :cart_item do |f|
    cart
    item { build(:product_with_items) }
    quantity 1
    price {|ct| item.price * ct.quantity}
  end
end