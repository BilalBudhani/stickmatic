# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    user { FactoryGirl.create(:user) }
    provider "MyString"
    uid "MyString"
    oauth_token "MyString"
    oauth_secret "MyString"
    oauth_expires_at "2014-04-30 00:35:56"
  end
end
