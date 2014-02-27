FactoryGirl.define do
  factory :line_item do |f|
    cart
    item { product_with_items }
    quantity 1
    price {|ct| item.price * ct.quantity}
  end
end