# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :coupon do
    code "ABCDE123"
    amount "50"
    percent ""
    expires_at {DateTime.now + 30.days}
  end
end
