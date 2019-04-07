require 'rails_helper'

RSpec.describe Tenant, type: :model do
  it { should have_many(:payments).dependent(:destroy)}
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:account_holder)}
  it { should validate_presence_of(:first_name)}
  it { should validate_presence_of(:last_name)}
  it { should validate_presence_of(:iban)}
  it { should validate_presence_of(:rent)}
  it { should validate_presence_of(:phone)}
end
