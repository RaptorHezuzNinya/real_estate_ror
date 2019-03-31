class TenantsController < ApplicationController
    before_action :set_tenant, only: [:show]

    def index
        @tenants = Tenant.all
        render json: @tenants
    end
    def show
        render json: @tenant
    end
    private
    def set_tenant
        @tenant = Tenant.find(params[:id])
    end
end
