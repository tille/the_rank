require 'spec_helper'

describe VotesController do
  let(:vote){ FactoryGirl.create(:vote) }
  
  # describe "create" do
  #   before do
  #     let(:valid_attr){ FactoryGirl.attributes_for(:vote) }
  #   end
  #   
  #   it "assigns character as @character" do
  #     post :create, { character: valid_attr_2 }
  #     assigns(:character).should be_a(Character)
  #     assigns(:character).should be_persisted
  #   end
  #   
  #   it "creates a new vote" do
  #     expect {
  #       post :create, {:vote => valid_attr}
  #     }.to change(Character, :count).by(1)
  #   end
  #   
  #   it "should be succesfully" do
  #     post :create, {:character => valid_attr_2}
  #     response.should redirect_to(Character.last)
  #   end
  #     
  #   describe "with invalid params" do
  #     it "should render the edit template" do
  #       Character.any_instance.stub(:save).and_return(false)
  #       post :create, {:character => valid_attr}
  #       assigns(:character).should render_template("new")
  #     end  
  #   end
  # end

end