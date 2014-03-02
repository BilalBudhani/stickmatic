# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pack do
    user { FactoryGirl.create(:user) }
    name "Pack Name"
    price 10
  end
end
