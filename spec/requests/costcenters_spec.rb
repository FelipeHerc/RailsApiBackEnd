require 'rails_helper'

RSpec.describe "Costcenters", type: :request do
  describe "GET /costcenters" do
    it "works! (now write some real specs)" do
      get costcenters_path
      expect(response).to have_http_status(200)
    end
  end
end
