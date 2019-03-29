class TenantsController < ApplicationController
    before_action :set_tenant, only: [:show]

    def index
        @tenants = Tenant.all
        render json: @tenants
    end
end
