class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :update, :destroy]

  def index
    @tenants = Tenant.all
    json_response(@tenants)
  end

  def create
    @tenant = Tenant.create!(tenant_params)
    json_response(@tenant)
  end

  def show
    json_response(@tenant)
  end

  def update
    @tenant.update(tenant_params)
    head :no_content
  end

  def destroy
    @tenant.destroy
    head :no_content
  end

  private

  def tenant_params
    params.permit(:email, :account_holder, :first_name, :last_name, :iban, :rent, :phone)
  end

  def set_tenant
    @tenant = Tenant.find(params[:id])
  end

  def set_tenant_payment
    @payment = @tenant.payments.find_by!(id: params[:id]) if @tenant
  end
end
