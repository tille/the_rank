FactoryGirl.define do
  factory :category do
    name "Killers"
    contest_id { FactoryGirl.create(:contest).id }
  end
end