require 'spec_helper'

describe Category do
  let(:category) { FactoryGirl.create(:category) }
  
  it "has a valid factory" do
    FactoryGirl.create(:category).should be_valid
    category.should be_valid
  end
  
  it "should be invalid without name" do
    Category.new.should have(1).error_on(:name)
  end

  it "should be invalid without a contest_id" do
    Category.new.should have(1).error_on(:contest_id)
  end
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:contest_id) }
    it { should ensure_length_of(:name).is_at_most(15) }
    it { should validate_presence_of(:contest_id) }
  end
  
  describe "relationships" do
    it { should have_many(:characters) }
    it { should have_many(:battles) }
    it { should belong_to(:contest) }
  end  
end