# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user { FactoryGirl.create(:user) }
    qty 1
    total_price 1
    status "MyString"
    remark "MyString"
    paid false
  end
end
