require 'spec_helper'

describe ApplicationController do

  describe "application layout" do

    controller do
      def new 
        render :nothing => true
      end
    end

    it "render the regular layout for all the controllers" do
      get :new
      response.should render_template(nil, layout: "application" )
    end

  end
end