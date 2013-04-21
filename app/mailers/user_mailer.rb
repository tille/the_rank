class UserMailer < ActionMailer::Base
  default from: "tille100@gmail.com"
  
  def registration_confirmation
    attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(:to => "tille100@gmail.com", :subject => "Just testing the wonderful ruby way!")
  end
end