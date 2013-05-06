# require 'spec_helper'
# 
# describe Battle do
#   let(:battle){ FactoryGirl.create(:battle) }
#   
#   it "has a valid factory" do
#     FactoryGirl.create(:battle).should be_valid
#     battle.should be_valid
#   end
#   
#   it "should be invalid without contester" do
#     [:contester1, :contester2].each do |attr_err|
#       Battle.new.should have(1).error_on(attr_err)
#     end
#   end
#   
#   it "have valid attributes" do
#     [:contester1, :contester2, :votes_contester1, :votes_contester2, :total_votes].each do |attr_req|
#       it { should validate_presence_of(attr_req) }
#     end
#     it { battle.contester1.id != battle.contester2.id } # doubt: the sintax is correct?
#   end
#   
#   describe "relationships" do
#     it "belong to character" do
#       should belong_to(:character)
#       should have_many(:votes)
#     end
#   end
# end