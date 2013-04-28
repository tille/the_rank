require 'spec_helper'

describe CharactersController do
  let(:valid_attr){ FactoryGirl.attributes_for(:character) }        
  let(:character){ Character.create! valid_attr }
  
  describe "index" do
    before do 
      character.save
      get :index
    end
    
    it "should render the layout application" do
      response.should render_template("application")
    end

    it "render the index view" do
      response.should render_template(:index)
    end
    
    it "should assign characters as @characters" do
      assigns(:characters).should eq([character])
    end
    
    it "should have be success" do
      response.should be_success
    end
  end
  
  describe "new" do
    before{ get :new }
    
    it "should be succes" do
      response.should be_success
    end
    
    it "should assign a new character as @character" do
      assigns(:character).should be_a_new(Character)
    end
  end  
  
  describe "show" do
    # render_views

    before{ get :show, { id: character.id } }
    
    it "assign the request character as @character" do
      assigns(:character).should eq(character)
    end
    
    it "should be success" do
      response.should be_success
    end
    
    it "should response to show/1.json " do
      get :show, :id => character.id, :format => :json
      response.should be_success
      response.body.should == character.to_json
    end

    it "should response to show/1.html " do
      get :show, id: character.id, :format => :html
      response.should be_success
    end
  end

  describe "edit" do
    it "it should be success" do
      response.should be_success
    end

    it "assign the request character as @character" do
      assigns(:character).should eq(@character)
    end
  end
  
  describe "create" do
    let(:valid_attr_2){ FactoryGirl.attributes_for(:character) }
    
    it "assigns character as @character" do
      post :create, { character: valid_attr_2 }
      assigns(:character).should be_a(Character)
      assigns(:character).should be_persisted
    end
    
    it "creates a new task" do
      expect {
        post :create, {:character => valid_attr_2}
      }.to change(Character, :count).by(1)
    end
    
    it "should be succesfully" do
      post :create, {:character => valid_attr_2}
      response.should redirect_to(Character.last)
    end
    
    it "should be succesfully with a json call" do
      post :create, {:character => valid_attr_2, :format => :json}
      response.body.should eq(Character.last.to_json)
    end

    describe "with invalid params" do
      it "should render the edit template" do
        Character.any_instance.stub(:save).and_return(false)
        post :create, {:character => valid_attr}
        assigns(:character).should render_template("new")
      end

      it "render @character.errors when the attributes are not valid with a json call" do
        Character.any_instance.stub(:save).and_return(false)
        post :create, {:character => valid_attr, :format => :json}
        response.body.should == assigns(:character).errors.to_json
      end
    end
  end
  
  describe "update" do
    before{ put :update, { id: character.id, character: valid_attr } }
            
    it "assing character as @character" do
      assigns(:character).should be_a(Character)
      assigns(:character).should eq(character)
    end
        
    it "should update a character" do
      response.should redirect_to(character)
    end

    it "should update a character and show the response as json file" do
      put :update, { id: character.id, character: valid_attr, :format => :json }
      response.body.should eq(character.to_json)
    end

    describe "with invalid params" do
      it "render @character.errors when the attributes are not valid with a json call" do
        Character.create(name: "tales")
        put :update, { id: character.id, character: {name: "tales"}, :format => :json }
        response.body.should == assigns(:character).errors.to_json
      end

      it "re-renders the 'edit' template" do
        Character.any_instance.stub(:save).and_return(false)
        put :update, {:id => character.id, :character => {}}
        response.should render_template("edit")
      end
    end
  end
    
  describe "destroy" do
    before{ delete :destroy, { id: character.id } }

    it "assing character as @character" do
      assigns(:character).should be_a(Character)
      assigns(:character).should eq(character)
    end
    
    it "should delete the character" do
      response.should redirect_to characters_url
    end    
  end
  
end