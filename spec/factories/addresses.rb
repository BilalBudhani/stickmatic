# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "A/01,Ramjane lane,Mumbai"
    city "Mum"
    state "Mah"
    pincode "400111"
    country "India"
  end
end
