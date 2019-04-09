# spec/requests/payments_spec.rb
require "rails_helper"

RSpec.describe "payments API" do
  # Initialize the test data
  let!(:tenant) { create(:tenant) }
  let!(:payments) { create_list(:payment, 20, tenant_id: tenant.id) }
  let(:tenant_id) { tenant.id }
  let(:id) { payments.first.id }

  # Test suite for GET /tenants/:tenant_id/payments
  describe "GET /tenants/:tenant_id/payments" do
    before { get "/tenants/#{tenant_id}/payments" }

    context "when tenant exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns all tenant payments" do
        expect(json.size).to eq(20)
      end
    end

    context "when tenant does not exist" do
      let(:tenant_id) { 0 }

      #   it "returns status code 404" do
      #     expect(response).to have_http_status(404)
      #   end

      #   it "returns a not found message" do
      #     expect(response.body).to match(/Couldn't find tenant/)
      #   end
    end
  end

  # Test suite for GET /tenants/:tenant_id/payments/:id
  describe "GET /tenants/:tenant_id/payments/:id" do
    before { get "/tenants/#{tenant_id}/payments/#{id}" }

    context "when tenant item exists" do
      #   it "returns status code 200" do
      #     expect(response).to have_http_status(200)
      #   end

      #   it "returns the item" do
      #     expect(json["id"]).to eq(id)
      #   end
    end

    context "when tenant item does not exist" do
      let(:id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for PUT /tenants/:tenant_id/payments
  describe "POST /tenants/:tenant_id/payments" do
    let(:valid_attributes) { { name: "Visit Narnia", done: false } }

    context "when request attributes are valid" do
      before { post "/tenants/#{tenant_id}/payments", params: valid_attributes }

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when an invalid request" do
      before { post "/tenants/#{tenant_id}/payments", params: {} }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a failure message" do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  #   # Test suite for PUT /tenants/:tenant_id/payments/:id
  describe "PUT /tenants/:tenant_id/payments/:id" do
    let(:valid_attributes) { { name: "Mozart" } }

    before { put "/tenants/#{tenant_id}/payments/#{id}", params: valid_attributes }

    context "when item exists" do
      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end

      it "updates the item" do
        updated_item = Item.find(id)
        expect(updated_item.name).to match(/Mozart/)
      end
    end

    context "when the item does not exist" do
      let(:id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for DELETE /tenants/:id
  describe "DELETE /tenants/:id" do
    before { delete "/tenants/#{tenant_id}/payments/#{id}" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
