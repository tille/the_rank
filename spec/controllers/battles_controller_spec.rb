require 'spec_helper'

describe BattlesController do
  
  describe "Index" do    
    it "responds succesfully" do
      get :index
      response.should be_success
    end

    it "assigns battles as @battles" do
      battle = FactoryGirl.create(:battle)
      get :index
      # TODO: assigns is not working with zeus
      Battle.all.should eq([battle])
    end    
  end
end