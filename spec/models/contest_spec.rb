require 'spec_helper'

describe Contest do
  let(:contest) { FactoryGirl.create(:contest) }
  
  it "has a valid factory" do
    FactoryGirl.create(:contest).should be_valid
    contest.should be_valid
  end
  
  it "should be invalid without name" do
    Contest.new.should have(1).error_on(:name)
  end
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
  
  describe "relationships" do
    it { should have_one(:category) }
    it { should have_many(:votes) }
  end  
end