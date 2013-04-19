# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking do
    seats 1
    status 1
    payment_status 1
    cc_reference "MyString"
    amount_payed "9.99"
  end
end
