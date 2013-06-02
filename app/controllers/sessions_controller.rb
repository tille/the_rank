class SessionsController < ApplicationController
  def new
    if current_user
      params[:remember_me] = true
      params[:email] = current_user.email
      cookies.delete(:auth_token)
    end
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user and @user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end      
      redirect_to root_path
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path
  end
end
