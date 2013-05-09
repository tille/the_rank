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
    should have_content "votar"
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
    pending "Need to create the action :create in vote"
    #click_link "votar"
  end
end