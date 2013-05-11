require 'spec_helper'

describe Vote do
  before do 
    @contest = FactoryGirl.create(:contest)
    @category = FactoryGirl.create(:category, contest_id: @contest.id)
    @character1 = FactoryGirl.create(:character, category_id: @category.id)
    @character2 = FactoryGirl.create(:character, category_id: @category.id)
    @battle = FactoryGirl.create(:battle, contester1: @character1.id, contester2: @character2.id, category_id: @category.id)
    @vote = FactoryGirl.create(:vote, battle_id: @battle.id, character_id: @character1.id, contest_id: @contest.id)
  end
  
  it "has a valid factory" do
    FactoryGirl.build(:vote, user_id: 300 ).should be_valid
  end
  
  it "should be invalid without contest_id" do
    Vote.new.should have(1).error_on(:contest_id)
  end
  
  it "should be invalid without character_id" do
    Vote.new.should have(1).error_on(:character_id)
  end

  describe "validations" do
    [:contest_id, :battle_id, :character_id, :user_id, :ip].each do |attr_req|
      it { should validate_presence_of(attr_req) }
    end
    
    describe "invalid vote" do      
      it "with the same user_id in the same battle" do
        FactoryGirl.build(:vote).should_not be_valid
      end
    end    
  end
  
  describe "after save" do
    it "should increment the total_votes" do      
      lambda {
        @battle.total_votes
        @battle.reload
       }.should change { @battle.total_votes }.by(1)
    end

    it "should increment the selected character votes" do      
      lambda {
        @battle.votes_contester1
        @battle.reload
       }.should change { @battle.votes_contester1 }.by(1)
    end
  end
  
  describe "relationships" do
    it { should belong_to(:contest) }
    it { should belong_to(:character) }
    it do
      pending "pending to create user model"
      # should belong_to(:user) 
    end
    it { should belong_to(:battle) }
  end  
end