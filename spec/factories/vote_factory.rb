FactoryGirl.define do
  factory :vote do
    user_id { 1 }
    contest_id { FactoryGirl.create(:contest).id }
    battle_id { 1 }
    character_id { FactoryGirl.create(:character).id }
    ip { "127.0.0.1" }
  end
end