FactoryGirl.define do
  factory :character do
    name "Pablo Escobar"
    category_id { FactoryGirl.create(:category).id }
  end
end