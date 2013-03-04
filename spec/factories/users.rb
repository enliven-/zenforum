# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	name 'foo bar'
  	email 'email@email.com'
  	password 'password'
  end
end
