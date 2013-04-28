require 'spec_helper'

describe MailerController do

  it "be success" do
    get :welcome
    response.should be_success 
  end

  it "render some text" do
    get :welcome
    response.body.should == "Sending welcome email!!"
  end
  
  it "sends a registration email" do
    get :welcome
    ActionMailer::Base.deliveries.last.to.should == ["tille100@gmail.com"]
  end

end