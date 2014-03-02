# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pack_item do
    image "http://distillery.s3.amazonaws.com/media/2011/02/02/6ea7baea55774c5e81e7e3e1f6e791a7_7.jpg"
    thumb "http://distillery.s3.amazonaws.com/media/2011/02/02/6ea7baea55774c5e81e7e3e1f6e791a7_5.jpg"
    uid  { SecureRandom.random_number(10000) }
    pack nil
  end
end
