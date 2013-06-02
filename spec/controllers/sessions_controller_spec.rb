require 'spec_helper'

describe SessionsController do

  describe "new" do
    before{ get :new }
    
    it "should be succes" do
      response.should be_success
    end    
  end
  
  describe "create" do
    before do
      @user = FactoryGirl.create(:user, password: "tales" )
      @email = "peranito@shakirita.com"
      @pwd = "tales"
    end
  
    it "assigns user as @user" do
      post :create, { email: @email, password: @pwd }
      assigns(:user).should be_a(User)
      assigns(:user).should be_persisted
    end
    
    it "should be succesfully" do
      post :create, { email: @email, password: @pwd }
      response.should redirect_to(root_path)
    end
    
    describe "with invalid params" do
      it "should render the new template" do
        post :create, { email: @email, password: "invalid_pwd" }
        assigns(:user).should render_template("new")
      end  
    end
  end
  
  describe "destroy" do
    it "redirect to root_path" do
      get :destroy
      response.should redirect_to(root_path)
    end
  end
end
