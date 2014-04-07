# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    add1 "Address line 1"
    add2 "Address line 2"
    city "Mumbai"
    state "State"
    zipcode "400003"
    mobile "123456789"
    landmark "Nearby"
    order
  end
end
