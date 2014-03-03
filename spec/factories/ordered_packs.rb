# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ordered_pack do
    order nil
    pack nil
    qty 1
  end
end
