# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accounting_transaction do
    balance "9.99"
    transaction_type 1
    description "MyString"
  end
end
