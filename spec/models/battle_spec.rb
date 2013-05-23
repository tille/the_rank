require 'spec_helper'

describe Battle do
  let(:battle){ FactoryGirl.create(:battle) }
  
  it "has a valid factory" do
    FactoryGirl.create(:battle).should be_valid
    battle.should be_valid
  end
  
  it "should be invalid without contester" do
    [:contester1, :contester2].each do |attr_err|
      Battle.new.should have(1).error_on(attr_err)
    end
  end
  
  it "should have an actual winner" do
    battle.winner.should_not be_false
  end
  
  describe "have valid attributes" do
    [:contester1, :contester2, :votes_contester1, :votes_contester2, :total_votes].each do |attr_req|
      it { should validate_presence_of(attr_req) }
    end
    it { battle.contester1 != battle.contester2 } # doubt: the sintax is correct?
  end
  
  describe "relationships" do
    it ("belong to character") do 
      pending "Need the correct foreign key association"
      # should belong_to(:character)
    end
    it ("have many votes") { should have_many(:votes) }
    it ("belongs to") { should belong_to(:category) }

  end
end