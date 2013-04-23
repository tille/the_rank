FactoryGirl.define do
  factory :category do
    sequence(:name){ |n| "Killers#{n}" } 
    contest_id { FactoryGirl.create(:contest).id }
  end
end