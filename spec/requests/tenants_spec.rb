require "rails_helper"

RSpec.describe "Real Estate API", type: :request do
  let!(:tenants) { create_list(:tenant, 10) }
  let(:tenant_id) { tenants.first.id }
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

  describe "GET /tenants/:id" do
    before { get "/tenants/#{tenant_id}" }

    context "when record is found" do
      it "returns a tenant" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(tenant_id)
      end
      it "return 200 when found" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:tenant_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Tenant/)
      end
    end
  end
  # Test suite for POST /tenants
  describe "POST /tenants" do
    # valid payload
    let(:valid_attributes) { { email: "x@x.com", account_holder: "x", first_name: "x", last_name: "x", iban: "x", rent: "x", phone: "x" } }

    context "when the request is valid" do
      before { post "/tenants", params: valid_attributes }

      it "creates a todo" do
        # debugger
        expect(json["email"]).to eq("x@x.com")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the request is invalid" do
      before { post "/tenants", params: { email: "Foobar" } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body).to match(/Validation failed: Account holder can't be blank, First name can't be blank, Last name can't be blank, Iban can't be blank, Rent can't be blank, Phone can't be blank/)
      end
    end
  end

  # Test suite for PUT /tenants/:id
  describe "PUT /tenants/:id" do
    let(:valid_attributes) { { email: "y@y.nl" } }

    context "when the record exists" do
      before { put "/tenants/#{tenant_id}", params: valid_attributes }

      it "updates the record" do
        expect(response.body).to be_empty
      end

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /tenants/:id
  describe "DELETE /tenants/:id" do
    before { delete "/tenants/#{tenant_id}" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
