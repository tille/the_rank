# -*- coding: utf-8 -*-
require 'spec_helper'

describe UserMailer do
  it "sends a registration email" do
    UserMailer.registration_confirmation().deliver
    ActionMailer::Base.deliveries.last.to.should == ["tille100@gmail.com"]
  end
end