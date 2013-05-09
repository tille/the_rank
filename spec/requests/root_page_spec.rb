require 'spec_helper'

describe "Root page" do
  subject { page }
  before { visit root_path }
    
  it "should be the initial page" do
    current_path.should == '/'
  end
    
  it "should go to the page - battles" do
    click_link "Check battles"
    current_path.should == battles_path
  end
end