FactoryGirl.define do
  factory :character do
    sequence(:name){ |n| "memito#{n}" }
    category_id { FactoryGirl.create(:category).id }
  end
end