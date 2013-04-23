FactoryGirl.define do
  factory :contest do
    sequence(:name) { |n| "fulanito#{n}" }
  end
end