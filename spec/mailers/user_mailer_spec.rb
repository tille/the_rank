# -*- coding: utf-8 -*-
require 'spec_helper'

describe UserMailer do
  it "sends a registration email" do
    UserMailer.registration_confirmation().deliver
    ActionMailer::Base.deliveries.last.to.should == ["tille100@gmail.com"]
  end

  it "sends a reset password email" do
    user = FactoryGirl.create(:user)
    user.send_password_reset
    ActionMailer::Base.deliveries.last.to.should == [user.email]
  end
end