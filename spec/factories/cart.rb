FactoryGirl.define do
  factory :cart do |f|
    status  Cart::PENDING
    user
  end
end