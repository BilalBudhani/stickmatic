# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pack do
    user nil
    name "MyString"
    price 10
  end
end
