require 'spec_helper'

describe VotesController do
  
  describe "create" do
    before do 
      @contest = FactoryGirl.create(:contest)
      @category = FactoryGirl.create(:category, contest_id: @contest.id)
      @character1 = FactoryGirl.create(:character, category_id: @category.id)
      @character2 = FactoryGirl.create(:character, category_id: @category.id)
      @battle = FactoryGirl.create(:battle, contester1: @character1.id, contester2: @character2.id, category_id: @category.id)
      @valid_attr = FactoryGirl.attributes_for(:vote, battle_id: @battle.id, character_id: @character1.id, contest_id: @contest.id)
    end
    
    it "assigns vote as @vote" do
      post :create, { vote: @valid_attr }
      assigns(:vote).should be_a(Vote)
      assigns(:vote).should be_persisted
    end
    
    it "creates a new vote" do
      expect {
        post "create", {:vote => @valid_attr}
      }.to change(Vote, :count).by(1)
    end
    
    it "should redirect to @vote" do
      post :create, {:vote => @valid_attr}
      response.should redirect_to contest_path(Vote.last.contest_id)
    end
      
    describe "with invalid params" do
      it "should redirect to home" do
        Vote.any_instance.stub(:save).and_return(false)
        post :create, {:vote => @valid_attr}
        response.should redirect_to root_path
      end  
    end
  end

end