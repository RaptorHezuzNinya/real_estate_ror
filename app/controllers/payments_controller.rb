class PaymentsController < ApplicationController
  before_action :set_payment
  before_action :set_tenant_payment, only: [:show, :update, :destroy]

  def index
    @payments = Payment.all
    json_response(@payments)
  end

  def create
    @payment = Payment.create!(payment_params)
  end

  def show
    json_response(@payment)
  end

  def update
    @payment.update(payment_params)
    head :no_content
  end

  def destroy
    @payment.destroy
    head :no_content
  end

  private

  def set_payment
    @payment = Tenant.find(params[:id])
  end

  def payment_params
    params.permit(:iban, :amount, :payment_json, :date, :account_holder)
  end

  def set_tenant_payment
    @payment = @tenant.payments.find_by!(id: params[:id]) if @tenant
  end
end
