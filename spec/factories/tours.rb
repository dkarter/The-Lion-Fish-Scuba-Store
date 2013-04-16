# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tour do
    name "MyString"
    location "MyString"
    description "MyString"
    start_time "2013-04-16 11:14:48"
    duration "9.99"
    seats_available 1
    price "9.99"
    status 1
  end
end
