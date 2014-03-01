# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    transaction_id SecureRandom.hex(16)
    action "MyString"
    message "MyString"
    user
    address
  end
end
