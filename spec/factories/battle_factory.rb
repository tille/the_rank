FactoryGirl.define do
  factory :battle do
    contester1 { FactoryGirl.create(:character).id }
    contester2 { FactoryGirl.create(:character).id }
    votes_contester1 0
    votes_contester2 0
    total_votes 0
  end
end