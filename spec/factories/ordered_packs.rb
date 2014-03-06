# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ordered_pack do
    pack { FactoryGirl.create(:pack_with_items) }
    order { FactoryGirl.create(:order, user: pack.user) }
    qty 1
  end
end
