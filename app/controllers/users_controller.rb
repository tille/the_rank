class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_url, notice: "Signed up!"
    else
      render "new"
    end
  end
end
