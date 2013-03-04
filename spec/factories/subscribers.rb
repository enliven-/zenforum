# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post_subscriber do
    email "MyString@MyString.com"
    type 'PostSubscriber'
  end

  factory :forum_subscriber do
    email "MyString@MyString.com"
    type 'ForumSubscriber'
  end
end
