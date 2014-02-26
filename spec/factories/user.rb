require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Name.name }
    f.username { Faker::Internet.user_name }
    f.provider 'instagram'
    f.uid { SecureRandom.hex }
    f.email  { |u| "#{u.uid}@instagram.com" }
    f.password { Devise.friendly_token[0,20]}
    f.token {Devise.friendly_token[0,20]}
  end
end