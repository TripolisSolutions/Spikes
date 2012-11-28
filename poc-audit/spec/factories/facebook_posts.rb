# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :facebook_post do
    account_id 1
    status "MyString"
    type ""
    post "MyText"
    post_at "2012-11-26 16:02:45"
  end
end
