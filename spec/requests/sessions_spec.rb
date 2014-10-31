require 'rails_helper'

RSpec.describe "Sessions", :type => :request do
  describe "GET /sessions" do
  	let(:machine){FactoryGirl.create(:machine)}
    it "works! (now write some real specs)" do
      get machine_sessions_path(machine)
      expect(response).to have_http_status(200)
    end
  end
end
