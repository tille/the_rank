require 'spec_helper'

describe Vote do
  let(:vote) { FactoryGirl.create(:vote) }
  
  it "has a valid factory" do
    FactoryGirl.create(:vote).should be_valid
    vote.should be_valid
  end
  
  it "should be invalid without contest_id" do
    Vote.new.should have(1).error_on(:contest_id)
  end
  
  it "should be invalid without character_id" do
    Vote.new.should have(1).error_on(:character_id)
  end

  describe "validations" do
    it { should validate_presence_of(:contest_id) }
    it { should validate_presence_of(:character_id) }
  end
  
  describe "relationships" do
    it { should belong_to(:contest) }
    it { should belong_to(:character) }
  end  
end