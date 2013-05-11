require 'spec_helper'
require 'support/request_helpers'

describe "Contest page" do

  subject { page }
  before do
    create_valid_db
    visit contest_path(@contest.id)
  end
  
  it "should contest#show page" do
    current_path.should == contest_path(@contest.id)
  end
  
  it "should have two buttons for vote" do
    all('.create_vote').size.should == 2
  end
  
  it "should have the text actual winner" do
    should have_content "Actual Winner: #{@battle.winner}"
    vote = FactoryGirl.create(:vote, battle_id: @battle.id, character_id: @character1.id)
    should have_content "Actual Winner: #{@battle.winner}"    
  end

  it "should have next battle button" do
    should have_content "Next Battle"
  end

  it "should have check battles link" do
    should have_content "Check battles"
  end
  
  it "should go to the page - battles" do
    click_link "Check battles"
    current_path.should == battles_path
  end

  it "should have content versus" do
    should have_content "vs"
  end
  
  it "assign one vote for the selected character" do
    expect {
      all('.create_vote')[0].click
    }.to change(Vote, :count).by(1)
    
    current_path.should == contest_path(@contest.id)
  end
end