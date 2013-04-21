FactoryGirl.define do
  factory :vote do
    character_id { FactoryGirl.create(:character).id }
    contest_id { FacotryGirl.create(:contest).id }
  end
end