require 'spec_helper'

describe ContestsController do
  let(:contest) { FactoryGirl.create(:contest) }

  it "render the layout application" do
    get :index
    response.should render_template("layouts/application")
  end  

  describe "index" do
    it "responds succesfully" do
      get :index
      response.should be_success
    end
    
    it "assign contests as @contests" do
      contest = FactoryGirl.create(:contest)
      get :index
      assigns(:contests).should eq([contest])
    end
  end
  
  describe "show" do
    before do
      @category = FactoryGirl.create(:category, contest_id: contest.id)
      @character = FactoryGirl.create(:character, category_id: @category.id)
      @character2 = FactoryGirl.create(:character, category_id: @category.id)
      @battle = FactoryGirl.create(:battle, contester1: @character.id, contester2: @character2.id, category_id: @category.id )
      get :show, { id: contest.id }
    end

    it "responds succesfully" do
      response.should be_success
    end    

    it "have a valid category" do
      category_test = assigns(:category)
      category_test.should_not be_false
      category_test.should eq(@category)
    end

    it "have two random characters c1, c2" do
      assigns(:c1).should_not be_false
      assigns(:c2).should_not be_false
    end    

    it "have two diferent random characters c1, c2" do
      assigns(:c1).should_not eq(assigns(:c2))
    end
    
    it "have a valid winner" do
      assigns(:winner).should_not be_false
    end
    
    it "have a valid battle" do
      assigns(:battle).should_not be_false
      assigns(:battle).should eq(@battle)
    end
    
    it "has a valid characters for show" do
      (assigns(:c1) == @character or assigns(:c1) == @character2).should be_true
      (assigns(:c2) == @character or assigns(:c2) == @character2).should be_true
    end
  end  
end