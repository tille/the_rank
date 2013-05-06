require 'spec_helper'

describe Vote do
  let(:vote) { FactoryGirl.create(:vote) }
  
  it "has a valid factory" do
    FactoryGirl.build(:vote).should be_valid
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
      before{ vote.save }
      it "with the same user_id in the same battle" do
        FactoryGirl.build(:vote).should_not be_valid
      end
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