FactoryGirl.define do
  factory :product do |f|
    product_type 1

    factory :product_with_product_items do
      after(:create) do |product,evaluator|
        FactoryGirl.create_list(:product_item, 9 , product: product)
      end
    end

  end
end