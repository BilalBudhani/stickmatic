# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pack do
    user { FactoryGirl.create(:user) }
    name "Pack Name"
    price 10

    factory :pack_with_items do
      ignore do
        pack_items_count 9
      end

      after(:create) do |pack, evaluator|
        create_list(:pack_item, evaluator.pack_items_count, pack: pack)
      end
    end
  end
end
