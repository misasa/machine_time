require "rails_helper"

RSpec.describe SessionsController, :type => :routing do
  describe "routing" do
    let(:machine_id){ 100 }
    it "routes to #index" do
      expect(:get => "/machines/#{machine_id}/sessions").to route_to("sessions#index", :machine_id => machine_id.to_s)
    end

    it "routes to #new" do
      expect(:get => "/machines/#{machine_id}/sessions/new").to route_to("sessions#new", :machine_id => machine_id.to_s)
    end

    it "routes to #show" do
      expect(:get => "/machines/#{machine_id}/sessions/1").to route_to("sessions#show", :machine_id => machine_id.to_s, :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/machines/#{machine_id}/sessions/1/edit").to route_to("sessions#edit", :machine_id => machine_id.to_s, :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/machines/#{machine_id}/sessions").to route_to("sessions#create", :machine_id => machine_id.to_s)
    end

    it "routes to #update" do
      expect(:put => "/machines/#{machine_id}/sessions/1").to route_to("sessions#update", :machine_id => machine_id.to_s, :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/machines/#{machine_id}/sessions/1").to route_to("sessions#destroy", :machine_id => machine_id.to_s, :id => "1")
    end

  end
end
