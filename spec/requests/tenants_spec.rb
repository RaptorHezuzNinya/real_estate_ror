require "rails_helper"

RSpec.describe "Real Estate API", type: :request do
  let!(:tenants) { create_list(:tenant, 10) }
  let(:tentant_id) { payments.first.id }
  # Test suite for GET /tenants
  describe "GET /tenants" do
    # make HTTP get request before each example
    before { get "/tenants" }

    it "returns tenants" do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
