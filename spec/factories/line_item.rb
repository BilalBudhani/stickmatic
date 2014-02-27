FactoryGirl.define do
  factory :line_item do |f|
    owner { create(:cart) }
    item { create(:product_with_product_items) }
    quantity 1
    price {|ct| item.price * ct.quantity}
  end
end