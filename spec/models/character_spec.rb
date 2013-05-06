require 'spec_helper'

describe Character do
  let(:character) { FactoryGirl.create(:character) }
  
  it "has a valid factory" do
    FactoryGirl.create(:character).should be_valid
    character.should be_valid
  end
  
  it "should be invalid without name" do
    Contest.new.should have(1).error_on(:name)
  end
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:category_id) }
    it { should validate_uniqueness_of(:name) }
    it { should ensure_length_of(:name).is_at_most(15) }
  end
  
  describe "relationships" do
    it { should belong_to(:category) }
    it { should have_many(:votes) }
  end  
end