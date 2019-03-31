class PaymentsController < ApplicationController
    before_action :set_payment, only: [:show]

    def index
        @payments = Payment.all
        render json: @payments
    end

    def show
        render json: @payment
    end

    private

    def set_payment
        @payment = Tenant.find(params[:id])
    end

end
