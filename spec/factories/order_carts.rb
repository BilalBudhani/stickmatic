# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_cart do
    cart
    order
  end
end
