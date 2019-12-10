require "rails_helper"

RSpec.describe CostcentersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/costcenters").to route_to("costcenters#index")
    end

    it "routes to #show" do
      expect(:get => "/costcenters/1").to route_to("costcenters#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/costcenters").to route_to("costcenters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/costcenters/1").to route_to("costcenters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/costcenters/1").to route_to("costcenters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/costcenters/1").to route_to("costcenters#destroy", :id => "1")
    end
  end
end
