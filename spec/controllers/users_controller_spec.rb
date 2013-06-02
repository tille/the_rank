require 'spec_helper'

describe UsersController do
  
  describe "create" do
    let(:valid_attr){ {email:"peranito@shakirita.com", password:"tales", password_confirmation:"tales"} }
  
    it "assigns user as @user" do
      post :create, { user: valid_attr }
      assigns(:user).should be_a(User)
      assigns(:user).should be_persisted
    end
  
    it "creates a new user" do
      expect {
        post :create, {:user => valid_attr}
      }.to change(User, :count).by(1)
    end
  
    it "should be succesfully" do
      post :create, {:user => valid_attr}
      response.should redirect_to(root_path)
    end
    
    describe "with invalid params" do
      it "should render the new template" do
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => valid_attr}
        assigns(:user).should render_template("new")
      end  
    end
  end

  describe "new" do
    before{ get :new }
    
    it "should be success" do
      response.should be_success
    end
    
    it "should assign a new user as @user" do
      assigns(:user).should be_a_new(User)
    end
  end
end
