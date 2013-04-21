class MailerController < ApplicationController

  def welcome
    UserMailer.registration_confirmation.deliver
    render text: "Sending welcome email!!"
  end
end