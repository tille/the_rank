require 'spec_helper'

describe VotesController do
  
  describe "create" do
    let(:valid_attr){ FactoryGirl.attributes_for(:vote) }
    
    it "assigns vote as @vote" do
      post :create, { vote: valid_attr }
      assigns(:vote).should be_a(Vote)
      assigns(:vote).should be_persisted
    end
    
    it "creates a new vote" do
      expect {
        post "create", {:vote => valid_attr}
      }.to change(Vote, :count).by(1)
    end
    
    it "should redirect to @vote" do
      post :create, {:vote => valid_attr}
      response.should redirect_to contest_path(Vote.last.contest_id)
    end
      
    describe "with invalid params" do
      it "should redirect to home" do
        Vote.any_instance.stub(:save).and_return(false)
        post :create, {:vote => valid_attr}
        response.should redirect_to root_path
      end  
    end
  end

end